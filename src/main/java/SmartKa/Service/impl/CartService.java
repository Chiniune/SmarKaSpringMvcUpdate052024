package SmartKa.Service.impl;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.Constants.Constant;
import SmartKa.DAO.CartDAO;
import SmartKa.DAO.OrderDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.Cart;
import SmartKa.Model.Order;
import SmartKa.Model.OrderDetail;
import SmartKa.Model.User;
import SmartKa.Response.*;
import SmartKa.Service.ICartService;
import SmartKa.Validators.Validators;

@Service
public class CartService implements ICartService {
	
	public ResponseObject getCart(HttpSession session) {
		ResponseObject responseObject = new ResponseObject();
		if (session.getAttribute(Constant.SESSION_USERNAME) == null) {
			responseObject.setSuccess(false);
		} else {
			if (((String) session.getAttribute(Constant.SESSION_USERNAME)).equals("")) {
				responseObject.setSuccess(false);
			} else {
				ArrayList<Cart> arrayList = CartDAO.findAll(session);
				if (arrayList == null) {
					responseObject.setSuccess(false);
				} else {
					responseObject.setSuccess(true);
					responseObject.setObject(arrayList);
				}
			}
		}
		return responseObject;
	}

	public ResponseObject addCart(HttpServletRequest request, HttpSession session) {
		int productId = Integer.parseInt(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		ResponseObject responseWithObject = new ResponseObject();
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		if (username != null) {
			Cart newCart = CartDAO.addUserCart(quantity, productId, session);
			if (newCart == null) {
				responseWithObject.setMessage("Add Cart Failed!");
				responseWithObject.setSuccess(false);
			} else {
				responseWithObject.setMessage("Add Cart Successfully!");
				responseWithObject.setSuccess(true);
				responseWithObject.setObject(newCart);
			}
		} else {
			responseWithObject.setMessage(CartDAO.addProductIntoLocalCart(quantity, productId, session));
			responseWithObject.setSuccess(true);
		}
		return responseWithObject;
	}

	public ResponseObject deleteCart(HttpServletRequest request, HttpSession session) {
		int cartId = Integer.parseInt(request.getParameter("id"));
		return CartDAO.deleteCartItemByID(cartId, session);
	}

	public ResponseObject updateCart(HttpServletRequest request, HttpSession session) {
		ResponseObject responseWithMessage = new ResponseObject();
		if (session.getAttribute(Constant.SESSION_USERNAME) == null
				|| ((String) session.getAttribute(Constant.SESSION_USERNAME)).equals("")) {
			responseWithMessage.setSuccess(false);
			responseWithMessage.setMessage("You must login to continue this progress");
		} else {
			String requestObjArray = request.getParameter("updatedCart");
			ObjectMapper objectMapper = new ObjectMapper();
			boolean check = true;

			try {
			    ArrayNode array = (ArrayNode) objectMapper.readTree(requestObjArray);
			    for (JsonNode node : array) {
			        ObjectNode object = (ObjectNode) node;
			        int quantity = object.get("quantity").asInt();
			        int productid = object.get("productid").asInt();
			        int cartid = object.get("cartid").asInt();
			        if (CartDAO.updateUserCart(quantity, productid, cartid, session)) {
			            check = true;
			        } else {
			            check = false;
			            break;
			        }
			    }
			} catch (Exception e) {
			    e.printStackTrace();
			}
			if (check) {
				responseWithMessage.setSuccess(true);
				responseWithMessage.setMessage("Update your cart successfully!");
			} else {
				responseWithMessage.setSuccess(false);
				responseWithMessage.setMessage("Some error when handle your cart!");
			}
		}
		return responseWithMessage;
	}

	public void addLocalCartIntoDB(HttpSession session) {
		ArrayList<Cart> localCart = (ArrayList<Cart>) session.getAttribute(Constant.LOCAL_CART);
		if (localCart != null) {
			for (Cart cart : localCart) {
				CartDAO.addUserCart(cart.getQuantity(), cart.getProduct().getId(), session);
			}
			session.removeAttribute(Constant.LOCAL_CART);
		}
	}

	public ResponseObject checkOut(HttpServletRequest request, HttpSession session) {
		ResponseObject responseObject = new ResponseObject();
		
		String reqObj = request.getParameter("form");
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode object = null;

		try {
		    object = objectMapper.readTree(reqObj);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		String country = object.get("country").asText();
	    String state = object.get("state").asText();
	    String street = object.get("street").asText();
	    String fullname = object.get("fullname").asText();
	    String phone = object.get("phone").asText();
	    String email = object.get("email").asText();
	    String note = object.get("note").asText();
	    String payment_method = object.get("payment_method").asText();
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		String date = Validators.getCurrentDate();
		
		ArrayList<Cart> arrayList = CartDAO.findAll(session);
		
		double total = 0;
		
		for (Cart cart : arrayList) {
			total += cart.getQuantity() * cart.getProduct().getPrice();
		}
		
		Order order = new Order(username, payment_method, total, date, "Pending", street, email, fullname, phone, note);
		
		if (OrderDAO.save(order)) {
			for (Cart cart : arrayList) {
				ArrayList<Order> orders = OrderDAO.findAll();
				int lastId = orders.get(orders.size() - 1).getId();
				OrderDAO.saveCart(new OrderDetail(cart.getProduct(), lastId, cart.getQuantity()));
				CartDAO.deleteCartItemByID(cart.getId(), session);
			}
			responseObject.setSuccess(true);
			responseObject.setMessage("Your order is pending!");
		} else {
			responseObject.setSuccess(false);
			responseObject.setMessage("Have some problems!");
		}
		
		return responseObject;
	}
}

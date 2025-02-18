package SmartKa.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import SmartKa.Response.ResponseObject;

public interface ICartService {
	ResponseObject getCart(HttpSession session);
	ResponseObject addCart(HttpServletRequest request, HttpSession session);
	ResponseObject deleteCart(HttpServletRequest request, HttpSession session);
	ResponseObject updateCart(HttpServletRequest request, HttpSession session);
	void addLocalCartIntoDB(HttpSession session);
	ResponseObject checkOut(HttpServletRequest request, HttpSession session);
}

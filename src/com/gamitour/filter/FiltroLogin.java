package com.gamitour.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteImp;

/**
 * Servlet Filter implementation class FiltroLogin
 */
@WebFilter("/FiltroLogin")
public class FiltroLogin implements Filter {

    /**
     * Default constructor. 
     */
    public FiltroLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		res.setHeader("Cache-Control", "no-store");
		res.setHeader("Pragma", "no-cache");
		res.setDateHeader("Expires", 0);
		
		ServiceCliente sCliente = new ServiceClienteImp();
		
		if(req.getSession().getAttribute("username") == null){
			req.getSession().setAttribute("filter", req.getRequestURL());
			res.sendRedirect(req.getContextPath() + "/content/login.jsp");
		}else{
			if(req.getSession().getAttribute("userRol").equals("admin")){
				chain.doFilter(request, response);
			}else{
				if(req.getServletPath().contains(req.getSession().getAttribute("userRol").toString())){
					chain.doFilter(request, response);
				}else{
					res.setStatus(403);
				}
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

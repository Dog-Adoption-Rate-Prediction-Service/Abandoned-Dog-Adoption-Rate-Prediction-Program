package com.front;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

   abstract public String execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException;
   
}
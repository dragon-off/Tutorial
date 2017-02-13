package org.apache.jsp.lib;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.qmatic.ConnectionContext;
import com.qmatic.network.User;
import java.util.List;
import java.util.Iterator;
import webwork.action.ActionContext;
import com.qmatic.staff.direct2.StaffDAO;
import com.qmatic.staff.direct2.Member;
import com.qmatic.web.staff.usergroup.PolicyUtils;
import java.net.*;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.Integer;

public final class _1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login/userpass.jsp");
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html; charset=windows-1251");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 
String db_username = "qmatic";
String db_password = "qmatic";

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    PolicyUtils pu = new PolicyUtils();

      out.write("\r\n");
      out.write("\r\n");


String Comment[]=new String[100];
Comment[0] = "Изменена политика группы для групп пользователей";
Comment[1] = "Был изменен состав группы";
Comment[2] = "Был изменен доступ к другим группам";
Comment[3] = "Проведены изменения в информации по группе персонала";
Comment[4] = "Изменен состав группы персонала";
Comment[5] = "Изменен доступ к группе персонала";
Comment[6] = "Изменена общая информация по пользователю";
Comment[7] = "Изменена принадлежность к группе пользователей";
Comment[8] = "Изменена принадлежность к группе персонала";
Comment[9] = "Добавлен новый пользователь/группа пользователей";
Comment[10] = "Были внесены изменения в настройку СУО <!-- настройка СУО -->";
Comment[11] = "Вход/Выход пользователя в систему СУО";
Comment[12] = "Вход/Выход пользователя в систему был произведен с ошибкой";
Comment[13] = "Внесены изменения в матрицу приоритетов <!-- матрица приоритетов -->";
Comment[14] = "Внесены изменения в матрицу компетенции <!-- матрица компетенции  матрица компетенций-->";
Comment[15] = "Сохранение изменений общей информации по пользователю";
Comment[16] = "Сохранение изменений во временных настройках тактик";
Comment[17] = "Изменение в настройках площадки <!-- настройки площадки -->";
Comment[18] = "Изменение в настройках статусов окон и специальной регистрации <!-- настройки статусов окон и специальной регистрации  -->";
Comment[19] = "Изменение во временных настройках чередования, времени и начала рабочего дня и др.";
Comment[20] = "Изменение настройки ВСП";
Comment[21] = "Изменение настройки отображения кнопок на экране touchscreen";

response.setContentType("text/html");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
//String connectionUrl = "jdbc:sqlserver://192.168.0.1;" + "databaseName=journal;user=journal;password=journal;";
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
int ComIndex = Integer.parseInt(request.getParameter("ComIndex"));
String DopComment = request.getParameter("Comment");
String Action = request.getParameter("action");
User user = (User)session.getAttribute("QM_USER");
String TypeId = request.getParameter("TypeId");
String UserName = (ComIndex!=12)?user.getUsername():"Неопределено";
out.print("123");



	
ResultSet rs = null;
Statement stmt = null;
 stmt = conn.createStatement(); 
//out.print("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment,action) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"|" +DopComment+"','"+Action+"');");
if(Action.length()>0)
	rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment,action) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),'"+Comment[ComIndex]+"|" +DopComment+"','"+Action+"');");
else
	rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"|" +DopComment+"');");

	 stmt = conn.createStatement();  

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

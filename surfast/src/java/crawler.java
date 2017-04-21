//working on net and displaying all header tags,title alt tags,meta keywords
import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class crawler
{
public static void main(String args[])
{

//Date d;
List <String> l=new ArrayList<String>();
l.add(args[0]);
Iterator it=l.iterator();
try{


while(it.hasNext())
{
String t,t1="",t2="",g1="",g2="",t3="",t4="",t5="",t6="",t7="",t8="",t9="",t10="",t11="",t12="",t13="",t14="";
java.util.Date ldate,bdate,cdate;
int ii,ij;
int s1,s2,s3,s4,y1,y2,y3,y4,y5,y6,y7,y8,y9,uid=0,count=0,uu=0;

	String ele=it.next()+"";
	//if(ele!=args[0])
	//{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/surfast","root", "");
		con.setAutoCommit(false);
		Statement stmt=con.createStatement();
		ResultSet rs1=stmt.executeQuery("select count(*) from site_reference where url='"+ele+"'");
		if(rs1.next())
		{
		count=rs1.getInt(1);	
		}
	        if(count==0)
	        {
		  uu=stmt.executeUpdate("insert into site_reference (url,`crawl-date`) values ('"+ele+"',now())");
                  System.out.print(uu);
                  
		  if(uu!=-1)
		 {
			ResultSet res=stmt.executeQuery("select sid from site_reference where url='"+ele+"'");
			if(res.next())
			{
			uid=res.getInt(1);
		 	}
		 }
                  
		t1=getWebPageSource(ele);
		URL u=new URL(ele);
		HttpURLConnection huc = (HttpURLConnection) u.openConnection();
		//System.out.print(t1);
		FileOutputStream fos=new FileOutputStream("aa.txt");
		fos.write(t1.getBytes());
                
                Statement hello=con.createStatement();
		ResultSet rsdata=hello.executeQuery("select * from site_reference");
                rsdata.last();
                int lastid=rsdata.getInt(1);
                
	       ldate=new java.util.Date(huc.getLastModified());
               SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               String date = DATE_FORMAT.format(ldate);
               System.out.println("Last modified date is"+date);
               Statement pratik=con.createStatement();
               int pratik1=pratik.executeUpdate("update site_reference set `modified-date`='"+date+"' where sid="+lastid+"");
               
//               bdate=new java.util.Date(huc.getDate());
//               SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//               String date1 = DATE_FORMAT1.format(bdate);
//               System.out.println("Built date is"+date1);
//               Statement p1=con.createStatement();
//               int buldate=p1.executeUpdate("update site_reference set `build-date`='"+date+"' where sid="+lastid+"");
               
               
	       int responseCode = huc.getResponseCode();
	       if (responseCode != 404)
		 {
		        System.out.println(u+"");
			t11=t1;	
                        t11= t11.replaceAll("\\<.*?\\>", "");
                        t13=t11;t14=t11;
		
		fos.close();
		//System.out.println(t11);//t11 is striped text from HTML
		//System.out.println(t1);
		
		
		
		
		
		t2=t1;t3=t1;t4=t1;t5=t1;t6=t1;t7=t1;t8=t1;t9=t1;t10=t1;
		String k1="",k2="",k3="",k4="",k5="",k6="",k7="",k8="",k9="",h="";
		 do
		{
			 y1=t2.indexOf("<meta");
			if(y1!=-1)
			{	
				k1=t2.substring(y1);
				 y3=k1.indexOf(">");
				k3=k1.substring(0,y3);
				 y2=k3.indexOf("name");
				k4=k3.substring(y2+6);
				 y4=k4.indexOf("\"");
				k5=k4.substring(0,y4);
				
				if(k5.equalsIgnoreCase("keywords"))
				{
					 y5=k3.indexOf("content");
					k6=k3.substring(y5+9);
					 y6=k6.indexOf("\"");
					k7=k6.substring(0,y6);
					//System.out.println("Keyword is:");
					//System.out.println(k7);	
				}
				if(k5.equalsIgnoreCase("description"))
				{
					 y7=k3.indexOf("content");
					k8=k3.substring(y7+9);
					 y8=k8.indexOf("\"");
					k9=k8.substring(0,y8);
                                         //Statement pp=con.createStatement();
                                         //int ppp1=pp.executeUpdate("insert into keyword (description) values('"+k9+"')");
					//System.out.println("Description is:");
					//System.out.println(k9);	
				}
				t2=k1.replace(k3,"");
			}
			else
				break;
		}while(true);
System.out.println("Keyword is:");
if(!k7.equals(""))
{
System.out.println(k7);
String MetaArray[]=k7.split(",");
System.out.println(MetaArray.length);
t12=t11;
for(int iu=0;iu<MetaArray.length;iu++)
{


//t11=t12;
	//String xs=MetaArray[iu].trim();
	int o1=MetaArray[iu].indexOf("\'");
	if(o1!=-1)
	{
		MetaArray[iu]=MetaArray[iu].replace("\'","");
	}
	int qw1,qw2,qw3;
	String qqq1,qqq2,qqq3;
	int cnt=0;
	int lastindex=0;
	do
	{
		lastindex=t11.toLowerCase().indexOf(MetaArray[iu].toLowerCase(),lastindex);
		if(lastindex!=-1)
		{
			cnt++;
			lastindex=lastindex+MetaArray[iu].length();
		}
		else
		{
			
			break;	
		}
	}while(true);

	//System.out.println(count);	
	 stmt.executeUpdate("insert into keyword (keyword,sid,rank) values ('"+MetaArray[iu]+"',"+uid+","+cnt+")");
                 	System.out.println(MetaArray[iu]+""+cnt);
	cnt=0;
}
}//end of if(k7.equals())
if(!k9.equals(""))
{ 
System.out.println("Description is:");
int o2=k9.indexOf("\'");
if(o2!=-1)
{
	k9=k9.replace("\'","");
}
 stmt.executeUpdate("insert into keyword (keyword,sid) values ('"+k9+"',"+uid+")");
 System.out.println(k9);	
}//end of if
		System.out.println("Title is:");
		ii=t1.indexOf("<title");
		if(ii!=-1)
		{
		 	ij=t1.indexOf("</title>");	
			g2=t1.substring(ii+7,ij);
			int x1=g2.indexOf(">");
			String q=g2.substring(x1+1);
			if(q.length()>70)
			{
                            
                            Statement fortitle=con.createStatement();
		ResultSet rsdatafortitle=fortitle.executeQuery("select * from site_reference");
                rsdatafortitle.last();
                int lastidfortitle=rsdatafortitle.getInt(1);
                                     
				h=q.substring(0,70);
				h= h.replaceAll("\\<.*?\\>", "");
				h=h.replace("'","");
				System.out.println("My title is:"+h);
                                Statement title=con.createStatement();
                                title.executeUpdate("update site_reference set title='"+h+"' where sid="+lastidfortitle+"");
			}

			else
			{	
                            Statement fortitle1=con.createStatement();
		            ResultSet rsdatafortitle1=fortitle1.executeQuery("select * from site_reference");
                            rsdatafortitle1.last();
                            int lastidfortitle1=rsdatafortitle1.getInt(1);
                            
                            
				h=q;
				h= h.replaceAll("\\<.*?\\>", "");
				h=h.replace("'","");
				System.out.println("My title is:"+q);
                                Statement title1=con.createStatement();
                                title1.executeUpdate("update site_reference set title='"+q+"' where sid="+lastidfortitle1+"");
			}
		
                    			//stmt.setString(1, h);
				if(!h.equals(""))
				{
					int qw1,qw2,qw3;
					String qqq1,qqq2,qqq3;
					int cnt1=0;
					do
					{
						qw1=t11.indexOf(h);
						if(qw1!=-1)
						{
							qqq1=t11.substring(qw1);
							qw2=t1.indexOf(" ");
							qqq2=t1.substring(0,qw2);
							qw3=h.length();
							t11=t11.substring(qw1+qw3);
							cnt1++;
						}
						else
							break;	
					}while(true);
					System.out.println(cnt1);
					 stmt.executeUpdate("insert into keyword (keyword,sid,rank) values ('"+h+"',"+uid+","+cnt1+")");
				}
                  				
                 
		}
System.out.println("H1");
{
String h1="",h2="",h3="",h4="",h5="",h6="",h7="",h8="",h9="";
int z1,z2,z3,z4,z5,z6,z7,z8,z9;		
		do
		{
			z1=t3.indexOf("<h1");
			if(z1!=-1)
			{
				h1=t3.substring(z1);
				z4=h1.indexOf("</h1>");
				h4=h1.substring(0,z4+5);
				z3=h1.indexOf(">");
				z5=h1.indexOf("</h1>");
				h2=h1.substring(z3+1,z5);
				h2= h2.replaceAll("\\<.*?\\>", "");
				h2=h2.replace("'","");
				System.out.println(h2);
				if(!h2.equals(""))
				{
					int qw1,qw2,qw3;
					String qqq1,qqq2,qqq3;
					int cnt3=0;
					t12=t14;
					do
					{
						qw1=t14.toLowerCase().indexOf(h2.toLowerCase());
						if(qw1!=-1)
						{
						qqq1=t14.substring(qw1);
						qw2=t1.indexOf(" ");
						qqq2=t1.substring(0,qw2);
						qw3=h2.length();
						t14=t14.substring(qw1+qw3);
						cnt3++;
					}	
					else
					{
						t14=t12;
						break;	
					}
				}while(true);

					stmt.executeUpdate("insert into keyword (keyword,sid,rank) values ('"+h2+"',"+uid+","+cnt3+")");
				}//end ofif(!h2.equals(""));
				t3=h1.replace(h4,"");	
			}
			else
				break;
			
		}while(true);
}
//header2
System.out.println("H2");
{
String h1="",h2="",h3="",h4="",h5="",h6="",h7="",h8="",h9="";
int z1,z2,z3,z4,z5,z6,z7,z8,z9;		
		do
		{
			z1=t4.indexOf("<h2");
			if(z1!=-1)
			{
				h1=t4.substring(z1);
				z4=h1.indexOf("</h2>");
				h4=h1.substring(0,z4+5);
				z3=h1.indexOf(">");
				z5=h1.indexOf("</h2>");
				h2=h1.substring(z3+1,z5);
				h2= h2.replaceAll("\\<.*?\\>", "");
				h2=h2.replace("'","");
				System.out.println(h2);
				if(!h2.equals(""))
				{
				int qw1,qw2,qw3;
				String qqq1,qqq2,qqq3;
				int cnt2=0;
				t12=t13;
				do
				{
					qw1=t13.toLowerCase().indexOf(h2.toLowerCase());
					if(qw1!=-1)
					{
					qqq1=t13.substring(qw1);
					qw2=t1.indexOf(" ");
					qqq2=t1.substring(0,qw2);
					qw3=h2.length();
					t13=t13.substring(qw1+qw3);
					cnt2++;
					}	
					else
					{
					t13=t12;
					break;	
					}
				}while(true);
				stmt.executeUpdate("insert into keyword (keyword,sid,rank) values ('"+h2+"',"+uid+","+cnt2+")");
				}//end of if(!h2.equals(""))
				t4=h1.replace(h4,"");	
			}
			else
				break;
			
		}while(true);
}
System.out.println("H3");
{
String h1="",h2="",h3="",h4="",h5="",h6="",h7="",h8="",h9="";
int z1,z2,z3,z4,z5,z6,z7,z8,z9;		
		do
		{
			z1=t5.indexOf("<h3");
			if(z1!=-1)
			{
				h1=t5.substring(z1);
				z4=h1.indexOf("</h3>");
				h4=h1.substring(0,z4+5);
				z3=h1.indexOf(">");
				z5=h1.indexOf("</h3>");
				h2=h1.substring(z3+1,z5);
				h2= h2.replaceAll("\\<.*?\\>", "");
				h2=h2.replace("'","");
				System.out.println(h2);
				if(!h2.equals(""))
				stmt.executeUpdate("insert into keyword (keyword,sid) values ('"+h2+"',"+uid+")");
				t5=h1.replace(h4,"");	
			}
			else
				break;
			
		}while(true);
}

System.out.println("H4");
{
String h1="",h2="",h3="",h4="",h5="",h6="",h7="",h8="",h9="";
int z1,z2,z3,z4,z5,z6,z7,z8,z9;		
		do
		{
			z1=t6.indexOf("<h4");
			if(z1!=-1)
			{
				h1=t6.substring(z1);
				z4=h1.indexOf("</h4>");
				h4=h1.substring(0,z4+5);
				z3=h1.indexOf(">");
				z5=h1.indexOf("</h4>");
				h2=h1.substring(z3+1,z5);
				h2= h2.replaceAll("\\<.*?\\>", "");
				h2=h2.replace("'","");
				System.out.println(h2);
				if(!h2.equals(""))
				stmt.executeUpdate("insert into keyword (keyword,sid) values ('"+h2+"',"+uid+")");
				t6=h1.replace(h4,"");	
			}
			else
				break;
			
		}while(true);
}

System.out.println("H5");
{
String h1="",h2="",h3="",h4="",h5="",h6="",h7="",h8="",h9="";
int z1,z2,z3,z4,z5,z6,z7,z8,z9;		
		do
		{
			z1=t7.indexOf("<h5");
			if(z1!=-1)
			{
				h1=t7.substring(z1);
				z4=h1.indexOf("</h5>");
				h4=h1.substring(0,z4+5);
				z3=h1.indexOf(">");
				z5=h1.indexOf("</h5>");
				h2=h1.substring(z3+1,z5);
				h2= h2.replaceAll("\\<.*?\\>", "");
				h2=h2.replace("'","");
				System.out.println(h2);
				
				if(!h2.equals(""))
				stmt.executeUpdate("insert into keyword (keyword,sid) values ('"+h2+"',"+uid+")");
				t7=h1.replace(h4,"");	
			}
			else
				break;
			
		}while(true);
}

System.out.println("H6");
{
String h1="",h2="",h3="",h4="",h5="",h6="",h7="",h8="",h9="";
int z1,z2,z3,z4,z5,z6,z7,z8,z9;		
		do
		{
			z1=t8.indexOf("<h6");
			if(z1!=-1)
			{
				h1=t8.substring(z1);
				z4=h1.indexOf("</h6>");
				h4=h1.substring(0,z4+5);
				z3=h1.indexOf(">");
				z5=h1.indexOf("</h6>");
				h2=h1.substring(z3+1,z5);
				h2= h2.replaceAll("\\<.*?\\>", "");
				h2=h2.replace("'","");
				System.out.println(h2);
				if(!h2.equals(""))
				stmt.executeUpdate("insert into keyword (keyword,sid) values ('"+h2+"','"+uid+"')");
				t8=h1.replace(h4,"");	
			}
			else
				break;
			
		}while(true);
}
System.out.println("IMG");
{
String j1="",j2="",j3="",j4="",j5="",j6="";
int m1,m2,m3,m4,m5,m6,m7;
		do
		{
			 m1=t9.indexOf("<img");
			if(m1!=-1)
			{
				j1=t9.substring(m1);
				m2=j1.indexOf(">");
				j3=j1.substring(0,m2);
				m3=j3.indexOf(" alt=");
				if(m3!=-1)
				{
					j4=j3.substring(m3+6);				
					m4=j4.indexOf("\"");
					if(m4==-1)
					{
						m4=j4.indexOf("\'");
					}
					j5=j4.substring(0,m4);
					j5=j5.replace("'","");
					System.out.println(j5);
					if(!j5.equals(""))
					stmt.executeUpdate("insert into keyword (keyword,sid) values ('"+j5+"',"+uid+")");
					
				}
				t9=j1.replace(j3,"");
			}
			else
				break;
			
		}while(true);
} 
//href links
System.out.println("href links");
{
String c1="",c2="",c3="",c4="",c5="",c6="",c7="",c8="";
int w1,w2,w3,w4,w5,w6,w7,w8;
	do
	{
		w1=t10.indexOf("<a ");
		//System.out.println(w1);
		if(w1!=-1)
		{
			c2=t10.substring(w1);
			w2=c2.indexOf("</a>");
			//System.out.println(c2.length());
			c3=c2.substring(0,w2);
			w3=c3.indexOf(" href=");
			if(w3!=-1)
			{
				c4=c3.substring(w3+7);
				w3=c4.indexOf("\"");
				if(w3==-1)
				{
					w3=c4.indexOf("\'");
				}
				c5=c4.substring(0,w3);
				if(!c5.startsWith("http://") && !c5.startsWith("https"))
				{
					/*String ele1;
					ele1=ele.replaceAll("/+$","");
					int li1=ele1.lastIndexOf("/");
					int li2=ele1.lastIndexOf(".");
					if(li2>li1)
					{
						ele1=ele1.substring(0,li1);
					}*/
					if(ele.endsWith("/") && c5.startsWith("/"))
					c5=c5.substring(1);
					if(!ele.endsWith("/") && !c5.startsWith("/"))
					ele=ele+"/";
					c5=ele+c5;
				}
				if(!l.contains(c5))
				l.add(c5);
				//System.out.println(c5 +"");
				
			}
		t10=c2.replace(c3,"");
		}
		else
			break;
			
	}while(true);
	
	/*int counter=0;
	while(it.hasNext())
	{
		Object element=it.next();
		System.out.println(element +"");
		counter++;
	}
	System.out.println(counter);*/
}//end of href
	 l.remove(0);
	 it=l.iterator();
}//end of if !404
 else
		 {
			System.out.println("BAD");
		}

//int[] b=stmt.executeBatch();
//con.commit();
//con.setAutoCommit(true);

}//end of if(slect count(*) from site reference )		
}//end of try
	catch(Exception e)
	{
	e.printStackTrace();
	System.out.println("xxx");
	}
//}//end of if(ele!=args[0])
}//end of while
}//end of try of fileoutputstream
catch(Exception e)
{
}
}
private static String getWebPageSource(String sURL) throws IOException {


        			URL url = new URL(sURL);
      			  URLConnection urlCon = url.openConnection();
      			  BufferedReader in = null;

      			  if (urlCon.getHeaderField("Content-Encoding") != null && urlCon.getHeaderField("Content-Encoding").equals("gzip")) {
          					  in = new BufferedReader(new InputStreamReader(
                   				 urlCon.getInputStream()));
      				  } else {
         					   in = new BufferedReader(new InputStreamReader(
             					       urlCon.getInputStream()));
  				      }

     				   String inputLine;
     				   StringBuilder sb = new StringBuilder();

     				   while ((inputLine = in.readLine()) != null)
        				    sb.append(inputLine);
      				  in.close();

      				  return sb.toString();
}

}
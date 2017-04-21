<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*, java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SurFast</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
<script src="js/surfast.js" type="text/javascript"> </script>
<script src="js/bootstrap.js" type="text/javascript"> </script>
<script src="js/bootstrap.min.js" type="text/javascript"> </script>
<script src="js/jquery.min.js" type="text/javascript"> </script>
<script src="http://maps.googleapis.com/maps/api/js"> </script>

<script>
var myCenter=new google.maps.LatLng(22.3000,70.7833);
var marker;

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:6,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  animation:google.maps.Animation.BOUNCE
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

</script>
</head>

<body>
    
     <!-- START BANNER & HOME -->
    <div class="container-fluid">
    <section id="home">
        
        <%
            java.util.Date currentdate = new  java.util.Date();
            Calendar c= Calendar.getInstance();
            int date=c.get(Calendar.DATE);
            int month=c.get(Calendar.MONTH)+1;
        %>
            

        <%! 
           Connection con;
           Statement st,s1,s2,s3,s4;
           ResultSet rs,r1,r2,r3,r4;
           
           String img="default.jpg";
           String img1="default.jpg";
           String img2="default.jpg";
        %>
         
        <%
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
           st=con.createStatement();
           rs=st.executeQuery("select * from datewise where Date="+date+" and Month="+month);
           boolean r=rs.next();
           
          if(r==true)
          {
              int id1=rs.getInt(1); 
              
              s1=con.createStatement();
              r1=s1.executeQuery("select * from dayimage where Day_ID="+id1);
              r1.next();
              img=r1.getString(2);
              r1.next();
                  img1=r1.getString(2);
                  r1.next();
                  img2=r1.getString(2);
 
          }
          else
          {
              s2=con.createStatement();
              r2=s2.executeQuery("select * from daywise where Day="+date+" and Month="+month);
              boolean b=r2.next();
        
              if(b==true)
             { 
                  int id2=r2.getInt(1);
                  s3=con.createStatement();
                  r3=s3.executeQuery("select * from dayimage where Day_ID="+id2+" limit 1,3");
                  r3.next();
                  img=r3.getString(2);
                  r3.next();
                  img1=r3.getString(2);
                  r3.next();
                  img2=r3.getString(2);
        
             }
              
              else
              {
        
                  
        
              }
          }
         %>
    
         
   <div class="image-slider">
       <img class="img-responsive" id="banner" src="images/<%=img%>" alt="Banner" />
       <div class="search-area">
           <form class="search-form" id="sa" action="index.jsp#result">
                <input type="text"  name="txtnm" placeholder="Search"/>
                <input type="hidden" name="page" value="1"/>
                <input type="submit" value="search" style="position: absolute; margin-left: 15px;margin-top: 15px;height: 30px; opacity: 0;z-index: 999"/>
                <i class="fa fa-2x fa-search"></i>     
            </form>
            
       </div>
       
      <%
         if(img!="default.jpg")  
         {   
      %>
       
       <div class="image-sequence">
                <ul  class="sequence-pagination">
                    <li> <a href="#" onclick="onImageClick('img1')"> <img id="img1" class="thumbnail-Image" src="images/<%=img%>" alt="First image"> </a> </li>
                    <li> <a href="#" onclick="onImageClick('img2')"> <img id="img2" class="thumbnail-Image" src="images/<%=img1%>" alt="Second image"> </a> </li>
                    <li> <a href="#" onclick="onImageClick('img3')"> <img id="img3" class="thumbnail-Image" src="images/<%=img2%>" alt="Third image"> </a> </li>
                </ul>
       </div> 
                
      <%
         }
      %>
   </div> 
   </section>
   </div>            
 <!-- END BANNER & HOME -->

            
   <!-- START MENU  -->
   <section>
    <nav class="navbar navbar-default menu"  id="menu" role="navigation">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="index.jsp">SurFast</a>
    </div>
   <div class="collapse navbar-collapse pull-right" id="example-navbar-collapse">
      <ul class="nav navbar-nav">
          <li> <a href="#home">Home</a> </li>
         <li> <a href="#result">Result</a> </li>
         <li> <a href="#services">Services</a> </li>
         <li> <a href="#about">About</a> </li>
         <li> <a href="#team">Team</a> </li>
         <li> <a href="#contact">Contact</a> </li>
      </ul>
   </div>
   </nav>
   </section>
   
   <script>
       $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') || location.hostname === this.hostname) {

                var target = $(this.hash);      
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');       
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    
    $(function(){
        var menu_top=$('#menu').offset().top;
        var sticky_navigation=function(){
            var scroll_top=$(window).scrollTop();
            
            if(scroll_top>menu_top) {
                $('#menu').css({'position':'fixed','top':0,'left':0, 'width':'100%'});
            }
            
            else{
                $('#menu').css({'position':'relative'});
            }
        };
                sticky_navigation();
                $(window).scroll(function(){
                    sticky_navigation();
                });
                        
                $('a[href="#"]').click(function(event){
                    event.preventDefault();
                });
                }); 
   </script>
   <!-- END MENU -->
   
   
   <!--START RESULT-->
   <section id="result" class="common-padding">
        <div class="title">
            <h1>Result</h1>
            <span class="under-title"></span>
        </div>
       
       <div class="result">
           <div class="container">
               <%!
        Connection consrch;
        Statement srch,srch1,srch2;
        ResultSet rsrch,rsrch1,rsrch2,rsrch3;
         int csrch=0;
        
    %>
    <%
         Object n=request.getParameter("txtnm");
       if(n!=null)
       {
        try
        {
              
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
        srch=con.createStatement();
        srch1=con.createStatement();
        srch2=con.createStatement();
        int pg1;
         Object p=request.getParameter("page");
            if(p==null)
            {
                pg1=1;
            }
            else
            {
            pg1=Integer.parseInt(p+"");
            }
           
           int l=pg1*10;
    
       String sql="select sid from keyword where keyword like'%"+request.getParameter("txtnm")+"%' limit "+(l-10+1)+",10";
      //out.print(sql);
       rsrch1=srch1.executeQuery(sql);
      
       int count=0;
       while(rsrch1.next())
       { count++;
           if(rsrch1!=null)
           {
           int s=rsrch1.getInt(1);
           String sql1="select sid,url,description,title from site_reference where sid='"+s+"'";
           rsrch2=srch2.executeQuery(sql1);
        
           while(rsrch2.next())
           {
              String u=rsrch2.getString("url");
              String desc=rsrch2.getString("description");
              String ttl= rsrch2.getString("title");
              int id=rsrch2.getInt(1);
            %> 
            <div>
            <%
              out.println(id);
              out.println("<a href="+u+">"+ttl+"</a><br>");
              out.println(desc);
            %>
            </div>
            <%
           }
           }
           
          
       }
        String sql1="select count(*) from keyword where keyword like'%"+request.getParameter("txtnm")+"%'";
        rsrch3=srch1.executeQuery(sql1);
        rsrch3.next();
        csrch=rsrch3.getInt(1);
        
       float pg2=csrch/10.0f;
     
      
       for(int j=1;j<=(pg2+(1-(pg2%1))%1);j++)
       {
           out.println("<a href=index.jsp?txtnm="+request.getParameter("txtnm")+"&page="+j+">"+j+"</a>");
           out.println("\t");
       }
       
      if(count==0)
           {
               out.println("No results found");
           }
        }  
       catch(Exception e)
       {
               out.print(e);
       }
       }
       
    %>
           </div>
       </div>
   </section>
   <!--END RESULT-->
         
   
  <!-- START SERVICES -->
    <section id="services" class="common-padding">
        <div class="title">
            <h1>Services</h1>
            <span class="under-title"></span>
        </div>

        <div class="our-services">
                <div class="container services">
                    <h1>Get in touch with other services</h1>
                    <p>Just check out all of the service lists below to get more real time information.</p>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div  class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="circle-services"> 
                                <a href="geoevent.jsp" target="new"><i class="fa fa-5x fa-calendar serviceicon"></i></a>
                                <h1>Events</h1>
                                <p>Get information about events being held all over the world.</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="circle-services">
                                <a href="weather.jsp" target="new"><i class="fa fa-5x fa-umbrella serviceicon"></i></a>
                                <h1>Weather</h1>
                                <p>Get location based weather information.</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="circle-services">
                                <a href="newsfeed.jsp" target="new"><i class="fa fa-5x fa-newspaper-o serviceicon"></i></a>
                                <h1>News</h1>
                                <p>Get online national & international news.</p>                               
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="circle-services">
                                <a href="login.jsp" target="new"><i class="fa fa-5x fa-gift serviceicon"></i></a>
                                <h1>Celebration</h1>
                                <p>Get yourself signed in and upload image for day celebration.</p>
                            </div>
                        </div>                       
                    </div>
                </div>
    </section>
    <!-- END SERVICES -->
    
    
     
    
    
    <!-- START ABOUT -->
        <section id="about" class="common-padding">
        <div class="title">
            <h1>About</h1>
            <span class="under-title"></span>   
        </div>
           
            
            <div class="about">  
          <div class="container">
              <h1>We Are Best Searcher.</h1>
              <p>We can do everything you are satisfied</p>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 about-content">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                        <img class="img-responsive" src="images/imac.png" alt="imac" />
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="all-about">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="about-icons">
                                        <a><i id="concept" class="fa fa-3x fa-pencil active" onclick="concept()"></i></a>
                                        <span>Concept</span>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="about-icons">
                                        <a><i id="idea" class="fa fa-3x fa-bullseye" onclick="idea()" ></i></a>
                                        <span>Idea</span>
                                    </div>
                                </div>
                      
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="about-icons">
                                        <a><i id="android" class="fa fa-3x fa-android" onclick="android()"></i></a>
                                        <span>Android App</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p id="concept-p">
                            'SurFast' is a web crawler based search engine that is designed to search for information on the World Wide Web. 
                            The search results are generally presented in a line of results often referred to as search engine results pages (SERPs). 
                            The information may be a mix of web pages, images, and other types of files.
                            SurFast is a complete replacement of already existing search engines with new and different features. <br/><br/>
                       
                            Our aim is to make customer more satisfied, and to provide the feeling of great security, safety and comfort.
                            By using this system the clients will feel the ease of getting more relevant information with great safety and security. 
                            SurFast will provide easy access to the users to search over the World Wide Web. 
                            The product will be designed to be easy to use with very good and intuitive CHI (Computer Human Interface) and reliability. It will be available to the users round the clock. The support will be added for every Operating System (Windows / UNIX / Mac). 
                            SurFast will also be available as android application so that user of the system can use it at any time. 
                        </p>
                        
                        <p id="idea-p" hidden="true">
                            'SurFast' a web crawler based search engine is a web-based solution where companies, individuals as well as visitor users can surf in a way search on anything and will be presented with a list of links that to the most relevant. 
                            Apart from searching one i.e. is any individual or organization can advertise their products. 
                            'SurFast' will display adds on a random basis. Not only that listing of various events in the city of the user would be shown, even the user will be acquainted with weather and temperature updates of their location.
                        </p>
                        
                        <p id="android-p" hidden="true">Get your android application here.</p>
                    </div>
                </div>
        </div>
        </div>
        </section>
    <!-- END ABOUT -->
    
    
    <!--START TEAM-->
   <section id="team" class="common-padding">
        <div class="title" data-scroll-reveal="enter top">
            <h1>Team</h1>
            <span class="under-title"></span>   
        </div>
        <div class="our-team">
                <div class="container">
                    <div class="team">
<!--                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. <br/> Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                        </p>-->
                        
                        
                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 all-member">
                       <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 team-member">
                           <div>
                           <div class="image1"> </div>
                           <div class="link">
                               <a href="http://facebook.com"><i class="fa fa-facebook fa-2x"></i></a>                             
                               <a href="http://twitter.com"><i class="fa fa-twitter fa-2x"></i></a>
                               <a href="linkedin.com"><i class="fa fa-linkedin fa-2x"></i></a>                   
                           </div>
                           </div>
                           
                           <div class="member-name">
                               <p>Pratik Kanani</p>
                               <p style="font-size:14px; text-transform:lowercase; margin-left:-4%">pratik.kanani30@gmail.com</p>
                           </div>
                       </div>
                      
                       <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 team-member">
                           <div>
                           <div class="image2"> </div>
                           <div class="link">
                               <a href="http://facebook.com"><i class="fa fa-facebook fa-2x"></i></a>                             
                               <a href="http://twitter.com"><i class="fa fa-twitter fa-2x"></i></a>
                               <a href="linkedin.com"><i class="fa fa-linkedin fa-2x"></i></a>                                
                           </div>
                           </div>
                           
                           <div class="member-name">
                               <p>Bansi Kaneriya</p>
                               <p style="font-size:14px; text-transform:lowercase; margin-left:-3%">bansi.kaneriya01@gmail.com</p>
                           </div>
                       </div>
                       
                        <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 team-member">
                            <div>
                            <div class="image3"> </div>
                           <div class="link">
                               <a href="http://facebook.com"><i class="fa fa-facebook fa-2x"></i></a>                             
                               <a href="http://twitter.com"><i class="fa fa-twitter fa-2x"></i></a>
                               <a href="http://linkedin.com"><i class="fa fa-linkedin fa-2x"></i></a>                                
                           </div>
                            
                            <div class="member-name">
                               <p>Binal Adesara</p>
                               <p style="font-size:14px; text-transform:lowercase">bh.adesara@yahoo.com</p>
                           </div>
                        </div>
                         
                        </div>
                        
                    </div>
                </div>
    </section>
    <!--END TEAM-->
    
    
    <!--START CONTACT-->
     <section id="contact" class="common-padding">
        <div class="title">
            <h1>Contact</h1>
            <span class="under-title"></span>
        </div>

        <div class="our-contact">
        <div id="googleMap"></div>
        <div class="container">
            
                <div class="col-lg-6 col-md-6 contact-form">
                    <h1>Get In touch</h1>
                    <div class="contact">
                        <form id="contact-form" action="#" method="get">
                            <ul>
                                <li>
                                    <input type="text" name="name" id="name" placeholder="Name">
                                </li>
                                <li>
                                    <input type="text" name="number" id="number" placeholder="Number">
                                </li>
                                <li>
                                    <input type="email" name="email" id="email" placeholder="E-Mail">
                                </li>
                                <li>
                                    <textarea name="message" id="message" placeholder="Message"></textarea>
                                    <input class="send" type="submit" id="submit" value="Send"/>
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>

                <div class="col-lg-5 col-md-5">
                    <div class="contact-info">
                        <span><i class="fa fa-2x fa-map-marker"></i>Rajkot</span>
                        <span><i class="fa fa-2x fa-phone"></i>mob. +91 81417 22346</span>
                        <span><i class="fa fa-2x fa-envelope"></i>surfast@gmail.com</span>
                        <span><i class="fa fa-2x fa-globe"></i>www.surfast.com</span>
                    </div>
                </div>
        </div>
         </div>
    </section>
    <!--END CONTACT-->
    
    
    <!-- START FOOTER -->
    <section id="footer">
    <div class="footer">
        <div class="container">
            <div class="icons">
                    <a class="footer-social" href="http://facebook.com"><i class="fa fa-facebook social-icon"></i></a>
                    <a class="footer-social" href="http://plus.google.com"><i class="fa fa-google-plus social-icon"></i></a>
                    <a class="footer-social" href="http://twitter.com"><i class="fa fa-twitter social-icon"></i></a>
                    <a class="footer-social" href="http://linkedin.com"><i class="fa fa-linkedin social-icon"></i></a>
                    <a class="footer-social" href="http://instagram.com"><i class="fa fa-instagram social-icon"></i></a>
                    
            </div>    
            <div class="copyright">
            <p>Copyright &copy; 2015 - <a href="http://www.surfast.com">SurFast</a></p>
            </div>
        </div>    
    </div>
    </section>
    <!-- END FOOTER -->

</body>
</html>
// START ABOUT OPTIONS
function onImageClick(image)
{
    var banner=document.getElementById('banner');
    var thumbnail=document.getElementById(image);
    banner.src=thumbnail.src;
}


    function concept()
{
    var conceptP=document.getElementById('concept-p');
    conceptP.style.display='inline';
    
    var ideaP=document.getElementById('idea-p');
    ideaP.style.display='none';
    
    var androidP=document.getElementById('android-p');
    androidP.style.display='none';
}

    function idea()
{
    var conceptP=document.getElementById('concept-p');
    conceptP.style.display='none';
    
    var ideaP=document.getElementById('idea-p');
    ideaP.style.display='inline';
    
    var androidP=document.getElementById('android-p');
    androidP.style.display='none';
}

    function android()
{
    var conceptP=document.getElementById('concept-p');
    conceptP.style.display='none';
    
    var ideaP=document.getElementById('idea-p');
    ideaP.style.display='none';
    
    var androidP=document.getElementById('android-p');
    androidP.style.display='inline';
}
//END ABOUT OPTION


//START SEO RULES MARQUEE EFFECT
function scroll(oid,iid)
     {
          this.oCont=document.getElementById(oid);
          this.ele=document.getElementById(iid);
          this.width=this.ele.clientWidth;
          this.n=this.oCont.clientWidth;
          this.move=function(){
          this.ele.style.left=this.n+"px";
          this.n--;
          if(this.n<(-this.width)){this.n=this.oCont.clientWidth;}
                              };
     }
     var vScroll;
     function setup()
     {
         vScroll=new scroll("oScroll","scroll");
         setInterval("vScroll.move()",5);
     }
  onload=function(){setup();};
//END SEO RULES MARQUEE EFFECT


// Paralax Background 
$('.bgEffect').each(function () {
    var $obj = $(this);
    $(window).scroll(function () {
        var yPos = -($(window).scrollTop() / $obj.data('speed'));
        var bgpos = '50% ' + yPos + 'px';
        $obj.css('background-position', bgpos);
    });
});
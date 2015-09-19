  //#declares (colors)
#declare SunColor = texture {
    pigment {   
        rgb <.9,.8,.1,.5>
    }
}  ;      
#declare SunColor2 = texture {
    pigment {   
        rgb <.9,.5,.1,.5>
    }
};
     
     
   //#declares (variable)
#declare SunRadius = 2;   
   
   
   //#declares (shapes)
#declare Ray = cone {  
    <0,0,0>
    .45*SunRadius
    <-2*(SunRadius/2)-SunRadius,0,0>
    0
    texture {SunColor}
}
#declare Ray2 = cone { 
    <0,0,0>
    .45*SunRadius
    <SunRadius+1*(SunRadius/2),0,0>
    0  
    rotate <0,0,-22.5>  
    texture {SunColor2}
}
#declare Astroid = box { 
    <0,0,0>
    <.1,.1,.1> 
    scale <.5*SunRadius,.5*SunRadius,.5*SunRadius>
    texture { 
        pigment {
            rgb <.7,.6,.3>
        }
    }
} 

                     
   //#declares (cameras)
#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;  
#declare BottomCameraPos = <0,-20,0>;
#declare ZoomFrontCameraPos = <0,0,-20>;
#declare LeftSideCameraPos = <-5,3,-5>; 
#declare RightSideCameraPos = <7,3,-10>;


//set-up 
background {
    rgb <0,0,.05>
  }
camera {
    location FrontCameraPos
    look_at <0,0,0>
}   


//light sources
light_source {         
    <0,0,-2*SunRadius>
    rgb <1,1,.7>
} 
light_source { 
    <0,0,2*SunRadius>
    rgb <1,1,.7>
} 


//sun   
#declare SUN = sphere {
    <0,0,0>
    SunRadius
    texture {SunColor}
}  ;
light_source { 
    <0,0,0>
    rgb <.9,.8,.1>
    looks_like {object {SUN}}
} 
                   
merge {object {
    Ray
}      
object {  
    Ray
    rotate <0,180,0>
}  
object {
    Ray
    rotate <0,0,-90>    
} 
object { 
    Ray
    rotate <0,0,90>
}   
object {  
    Ray
    rotate <0,0,-45>
}     
object {
    Ray
    rotate <0,0,-135>     
}
object {  
    Ray
    rotate <0,0,45>
}     
object {  
    Ray
    rotate <0,0,135>
} 
}
object { 
    Ray2
}       
object {   
    Ray2
    rotate <0,0,-90>
}        
object {
    Ray2
    rotate <0,0,90>
}  
object { 
    Ray2
    rotate <0,0,-45>
} 
object { 
    Ray2
    rotate <0,0,-135>
}           
object {   
    Ray2
    rotate <0,0,45>
}     
object {
    Ray2
    rotate <0,0,135>
} 
object { 
    Ray2
    rotate <0,0,180>
} 
                 


//Jupiter
sphere { 
    <1.85*SunRadius,.75*SunRadius,0>
    .6*SunRadius
    texture { 
        pigment {  
            rgb <1,0,0>
        }
    }
}  


//Saturn
sphere { 
    <-1.7*SunRadius,-.7*SunRadius,0>
    .45*SunRadius
    texture {   
        pigment { 
            rgb <.7,.7,.3>
        }
    }
}
torus { 
    .65*SunRadius
    .075*SunRadius
    rotate <-40,0,0>  
    scale <1,.5,1> 
    translate <-1.7*SunRadius,-.7*SunRadius,0>
    texture { 
        pigment { 
            rgb <.5,.6,.4>
        }            
    }
}  


//Uranus
sphere { 
    <1.55*SunRadius,-.7*SunRadius,0>
    .3*SunRadius 
    texture {
        pigment {
            rgb <.4,.8,.8>
        }
    }
} 
torus {
    .5*SunRadius
    .05*SunRadius
    rotate <0,0,-135>  
    scale <.5,1,1>
    translate <1.55*SunRadius,-.7*SunRadius,0>  
    texture {  
        pigment {  
            rgb <1,1,1>
        }
    }                    
}                        


//Neptune
sphere { 
    <-1.55*SunRadius,.7*SunRadius,0>
    .3*SunRadius
    texture {
        pigment {
            rgb <.3,.3,.7>
        }
    }
} 


//Venus
sphere {
    <-.6*SunRadius,1.45*SunRadius,0>
    .15*SunRadius
    texture { 
        pigment { 
            rgb <.9,.3,0>
        }
    }
}   


//Earth
sphere {
    <.6*SunRadius,-1.45*SunRadius,0>
    .125*SunRadius
    texture { 
        pigment {
            rgb <0,1,.3>
        }
    }
}      


//Mars
sphere { 
    <-.58*SunRadius,-1.4*SunRadius,0>
    .1*SunRadius
    texture {
        pigment { 
            rgb <.9,.6,.3>
        }
    }
} 


//Mercury
sphere { 
    <.585*SunRadius,1.4*SunRadius,0>
    .085*SunRadius
    texture {
        pigment {
            rgb <.6,.6,.5>
        }
    }
}            

#declare AstroidField = union { 
    object {
        Astroid  
            translate <-.75*SunRadius,-1.75*SunRadius,0> 
    } 
    object {  
        Astroid
            rotate <0,0,45>
            translate <1.1*SunRadius,1.3*SunRadius,0> 
    }
    object {
        Astroid 
            rotate <0,0,45>
            translate <.15*SunRadius,1.7*SunRadius,0>
    }   
    object {
        Astroid  
            rotate <0,0,20>
            translate <.3*SunRadius,1.75*SunRadius,0> 
    }                            
    object {  
        Astroid   
            rotate <0,0,20>
            translate <SunRadius,1.45*SunRadius,0>
    } 
    object {       
        Astroid   
            rotate <0,0,-45>
            translate <.485*SunRadius,1.775*SunRadius,0>
    } 
    object {  
        Astroid  
            rotate <0,0,-45>
            translate <.83*SunRadius,1.625*SunRadius,0>
    } 
}

//Astroid Field, Bottom Left
object {
    AstroidField
}


//Astroid Field, Top Right
object {  
    AstroidField
    rotate <0,0,180>
}
  


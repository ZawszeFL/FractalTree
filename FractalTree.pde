private double fractionLength = .75; 
private int smallestBranch = 10	; 
private double branchAngle = .2;  
private double time=0.5;
//Rain[] raindrops = new Rain[10];
public void setup() 
{   

	

	size(1000,1000);    
	/*for(int i=0; i<10;i+=1)
  {
    raindrops[i]= new Rain();


  }
  */

	
} 
public void draw() 
{   
	background(7,36,84);
	fill(1, 17, 4);
	line(500,1000,500,750);   
	noStroke();
	rect(0,700,1050,1050);
	stroke(138,43,226);
	

	drawBranches(500,750,150,3*Math.PI/2);  //will add later 
/*for(int i=0; i<10;i+=1)
  {
    raindrops[i].show();
    raindrops[i].move();
  }
*/



} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	

	double angle1=angle+branchAngle;
	double angle2=angle-branchAngle;
	
	int endX1=(int)(branchLength*Math.cos(angle1) + x);
	int endY1=(int)(branchLength*Math.sin(angle1) + y);
	int endX2=(int)(branchLength*Math.cos(angle2) + x);
	int endY2=(int)(branchLength*Math.sin(angle2) + y);
	branchLength=branchLength*fractionLength;
	stroke(114, 118, 124);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);



	if(branchLength>smallestBranch)
	{

		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}

	if(time>branchAngle)
{
	
	time+=0.6;
	branchAngle+=0.000005;
	branchLength+=0.5;
	if(branchAngle>=0.8)
	{
		branchAngle=0.2;
		branchLength=branchLength*fractionLength;
	}


	redraw();
}

} 
class Rain
{
	private int myX,myY;
	
	Rain(){
		myX=(int)(Math.random()*1000);
		myY=(int)(Math.random()*-1000);
		
	}

public void show(){
	stroke(138,43,226);
	line(myX,myY,myX,myY+10);
}
public void move(){
	myY+=(int)(Math.random()*20+30);
	if(myY>=1000)
	{
		myY=(int)(Math.random()*-50);
	}
}
}
void keyPressed()
{
	if(key=='a')
	{
		branchAngle-=.05;
		redraw();
	}
	if(key=='d')
	{
		branchAngle+=.05;
		redraw();
	}
	if(key=='w')
	{
		if(fractionLength<.75)
		{
			fractionLength+=.03;
		}
		redraw();
	}
	if(key=='s')
	{
		if(fractionLength>.6);
		{
			fractionLength-=.03;
			redraw();
		}
	}
}

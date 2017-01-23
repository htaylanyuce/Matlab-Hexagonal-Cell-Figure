function hexagon(cote,x0,y0)
   %cote= side size;,(x0,y0) exagon center coordinates;
   x=cote*[-1 -0.5 0.5 1 0.5 -0.5 -1]+x0;
   y=cote*sqrt(3)*[0 -0.5 -0.5 0 0.5 0.5 0]+y0;
   plot(x,y,'k');
   
end
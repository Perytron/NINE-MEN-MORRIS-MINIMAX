function drawingTest
figure('WindowButtonDownFcn',@wbdcb)
ah = axes('SortMethod','childorder');
axis ([1 10 1 10])
title('Click and drag')

   function wbdcb(src,callbackdata)
     seltype = src.SelectionType;
     if strcmp(seltype,'normal')
        src.Pointer = 'circle';
        cp = ah.CurrentPoint;
        xinit = cp(1,1);
        yinit = cp(1,2);
        hl = line('XData',xinit,'YData',yinit,...
        'Marker','p','color','b');
        src.WindowButtonMotionFcn = @wbmcb;
        src.WindowButtonUpFcn = @wbucb;
     end    
 
        function wbmcb(src,callbackdata)
           cp = ah.CurrentPoint;
           xdat = [xinit,cp(1,1)];
           ydat = [yinit,cp(1,2)];
           hl.XData = xdat;
           hl.YData = ydat;
           drawnow
        end
   
        function wbucb(src,callbackdata)
           last_seltype = src.SelectionType;
           if strcmp(last_seltype,'alt')
              src.Pointer = 'arrow';
              src.WindowButtonMotionFcn = '';
              src.WindowButtonUpFcn = '';
           else
              return
           end
        end
  end
end
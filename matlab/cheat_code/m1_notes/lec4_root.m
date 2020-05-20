% exercise root
 in = input('input [a b c]: ');
 a = in(1);
 b = in(2);
 c = in(3);
 if a==0 && b==0 && c==0
     disp('indeterminate.');
 elseif a==b && b==0
     disp('no solution.');
 elseif a==0
     x = -c/b;
     disp('one root.');
 elseif b.^2<4*a*c
     disp('roots are complex.');
 elseif b.^2==4*a*c
     x = b/(2*a);
 else b.^2>4*a*c
     x1 = (-b + sqrt( b.^2 - 4.*a.*c))./(2.*a)
     x2 = (-b - sqrt( b.^2 - 4.*a.*c))./(2.*a)
 end
 coef = [a b c];
 roots = polyval(coef,[x1, x2]);
 disp(roots);
 
 %while 之類的
 %教一些structure的心法，很棒
 
 
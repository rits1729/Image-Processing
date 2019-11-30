function res=and1(val1,val2)
  f=1;
  res=0;
  for i=1:8
    r1=mod(val1,2);
    val1=idivide(val1,2);
    r2=mod(val2,2);
    val2=idivide(val1,2);
    if r1==1 && r2==1
      res=res+f*1;
    endif
    if val1==0 || val2==0
      break;
    endif
    f=f*2;
  endfor
endfunction

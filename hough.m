n=input("Enter the number of points: ");
x=zeros(1,n);
for i=1:n
  x(1,i)=input("Enter the x-coordinates: ");
endfor
y=zeros(1,n);
for j=1:n
  y(1,j)=input("Enter the y-coordinates :");
endfor
c_val1=input("Enter the starting value of c: ");
c_val2=input("Enter the ending value of c: ");
c_size=c_val2-c_val1+1;
c=zeros(1,c_size);
val=c_val1;
for i=1:c_size
  c(1,i)=val;
  val+=1;
endfor
m_val1=input("Enter the starting points: ");
m_val2=input("Enter the ending points: ");
m_size=m_val2-m_val1+1;1
m=zeros(1,m_size);
val1=m_val1;
for i=1:m_size
  m(1,i)=val1;
  val1+=1;
endfor
acc=cell(m_size,c_size);
for i=1:n
  for j=1:m_size
    p=y(1,i)+m(1,j)*x(1,i);
    for k=1:c_size
      if p>=c(1,1) && p<=c_val2
        if p==c(1,k)
          str1=num2str(i);
          str1=[str1,","];
          str2=num2str(acc{j,k});
          acc{j,k}=[str1,str2];
          break;
        endif
      endif
    endfor
  endfor
endfor
%Displaying Points
disp("Displaying Points");
for i=1:n
  index=num2str(i);
  val1=num2str(x(1,i));
  val2=num2str(y(1,i));
  val1=["points",index,"- (",val1,","];
  val2=[val2,")"];
  val1=[val1,val2];
  display(val1);
endfor
disp("Displaying Connections");
for i=1:m_size
  for j=1:c_size
    if length(acc{i,j})>4
      disp(acc{i,j});
      newstr=regexp(acc{i,j},',','split');
      for k=1:length(newstr)-1
        v=str2num(newstr{1,k});
        u=num2str(x(1,v));
        w=num2str(y(1,v));
        new=["(",u,",",w,")"];
        disp(new);
      endfor
    endif
  endfor
endfor


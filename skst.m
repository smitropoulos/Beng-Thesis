clc;
clear all;


a=[1,12,3;5,44,5];

b=[21,3,3;12,10,6];


[m1,n1]=size(a);
[m2,n2]=size(b);


a=sum((a).^2);
nw=sum(a,2);

b=sum(b.^2);
gw=sum(b,2);



nw=0,000000;

for i=1:size(a,1)
    
    for k=1:size(a,2)
     
        nw=nw+(a(i,k)^2);
        
        disp(nw)
        
    end
    
end

gw=0,0000;

for i=1:size(b,1)
    
    for k=1:size(b,2)
     
        gw=gw+(b(i,k)^2);
        
        disp(gw)
        
    end
    
end

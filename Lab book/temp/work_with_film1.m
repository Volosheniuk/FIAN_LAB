function  [ressR,ressB]= work_with_film(B,R,step,name,xname,yname,flag,interpolmethod)
%������ R(�)=(R(B)+?-R(-B))/2, ��� +?- ������� �� �������� flag ( +  0==flag, - 1==flag) enterpolmethod--����� ������������ 0-nearest, 1-linear, 2-spline,3-pchip,4-v5cubic 
%   ������� ������ ����� (Bmax-Bmin)/(step+1), ��� Bmax -- ������������
%   �������� ����  Bmin-- �����������. ����� �������� ������ �������� R ��
%   ����� ����� � ������� ������������. ������ ���������� �������� �������
[B,i]=unique(B);
 R=R(i); 
 bmax = max(B);
 bmin = min(B);
 if abs(bmin)<=abs(bmax)
    step1=abs(2*bmin/(step+1));
    x=bmin:step1:abs(bmin);
 else 
    step1=abs(2*bmax/(step+1));
    x=-abs(bmax):step1:abs(bmax);
 end
 res=[];
 switch interpolmethod
    case 0
        c='nearest';
    case 1
        c='linear';
    case 2
        c='spline';
    case 3
        c='pchip';
    case 4
        c='v5cubic';
    otherwise
        c='nearest';
end
 R1=interp1(B,R,x,c);
 for i=1:1:fix(length(R1)/2),
    if flag==0
         res(i)=(R1(i)+R1(length(R1)-i+1))/2;
    else
        res(i)=(R1(i)-R1(length(R1)-i+1))/2;
    end
 end
 x=[];
 if abs(bmin)<=abs(bmax)
    for i=1:1:fix(length(R1)/2),
        x(i)=bmin+(i-1)*step1;
    end
 else
     for i=1:1:fix(length(R1)/2), 
        x(i)=-abs(bmax)+(i-1)*step1;
     end
 end
% plot(x,res);
% title(name);
% xlabel(xname);
% ylabel(yname);
ressR=res;
ressB=x;
end


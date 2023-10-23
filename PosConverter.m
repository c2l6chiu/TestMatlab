function Position=PosConverter(DPpos,r)
dim=[DPpos(3) DPpos(4)];
pos=[DPpos(1) DPpos(2)];
Position(1)=pos(1)+r(1)*dim(1);
Position(2)=pos(2)+r(2)*dim(2);
Position(3)=r(3)*dim(1);
Position(4)=r(4)*dim(2);
end
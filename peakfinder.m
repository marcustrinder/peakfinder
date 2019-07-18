%Finds peaks of data and allows to cut unwanted peaks


[pks,locs]=findpeaks(data(:,2),data(:,1));

findpeaks(data(:,2),data(:,1))
prompt = 'enter bottom margin for cut off? ';   %disregards peaks below set value c
c = input(prompt);

%for i=1:size(pks)
%    if pks(i)>c
 %       pks_n(1,i)=pks(i);
%        locs_n(1,i)=locs(i);
 %   end
%end

prompt = 'enter max radius margin for cut off? ';   %disregards peaks below set value c
max = input(prompt);
prompt = 'enter min radius';
min = input(prompt);

for i=1:size(locs)
    if locs(i)<max && locs(i) > min && pks(i) > c
        pks_n(1,i)=pks(i);
        locs_n(1,i)=locs(i);
    end
end


pks_n(pks_n==0)=[];
locs_n(locs_n==0)=[];

peaks = transpose(pks_n);
locations = transpose(locs_n);

hold off
plot(locations,peaks,'s','MarkerFaceColor',[1 .6 .6]);
hold on
plot(data(:,1),data(:,2));


again='y';
while again=='y'

    prompt = 'cut peaks?';
again = input(prompt,'s');
    if again =='y'
prompt = 'Cut peak number (in reverse order)? ';    %removes peak at specified position
x = input(prompt);
    
peaks(x)=[];
locations(x)=[];

    end

prompt = 'cut again?';
again = input(prompt,'s');  %input 'y' to cut again and 'n' to stop

end
hold off
plot(locations,peaks,'s','MarkerFaceColor',[1 .6 .6]);
hold on
plot(data(:,1),data(:,2));



m=size(peaks);
 
 
 for j=1:m
     rm(j)=locations(j)*14*10^(-6);     %converts from pixels to metres
     rm_2(j)=rm(j)^2;
 end
 
%
% generate a data set that can be manipulated manually to test Adv Math
% Data Analysis section on errors, central limit theorem etc
%

% generate some position noise
nobs = 6;
dxy = randn(2*nobs,2);

% want to reduce mess, so round to nearest 10cm for everything:
dxy = round(dxy*10)./10;

%% scenario is making estimates of the height of a giant redwood and
% determining whether it has grown.



% actual postions
BMxy0 = [20 100];
TREExy0 = [140 260];
horiz0 = sqrt(sum((TREExy0-BMxy0).^2));

TREEz0 = 90;
TREEgrow = 7.5;   % amount of height change

nobs = 6;


BMxy = repmat(BMxy0,nobs,1)+dxy(1:nobs,:);
TREExy = repmat(TREExy0,nobs,1)+dxy(nobs+1:2*nobs,:);

sprintf('%5.1f  %5.1f    %5.1f  %5.1f\n',[BMxy';TREExy'])

% these are the orginal values
allxy = [20.9  100.1    138.7  260.0
      22.0  100.6    139.6  258.1
      20.9   98.6    141.2  257.9
      20.3  100.3    140.0  258.8
      20.6   99.8    140.6  259.0
      20.4   99.1    139.0  258.8];

  % this has swapped values as test for exam
badxy = [20.9  100.1    138.7  260.0
      22.0  100.6    139.6  258.1
      20.9   98.6    141.2  257.9
      20.3  100.3    258.8  140.0  
      20.6   99.8    140.6  259.0
      20.4   99.1    139.0  258.8];
  
  % this has the swapped values NaN-ed out
fixxy = [20.9  100.1    138.7  260.0
      22.0  100.6    139.6  258.1
      20.9   98.6    141.2  257.9
      20.3  100.3    NaN  NaN  
      20.6   99.8    140.6  259.0
      20.4   99.1    139.0  258.8];
  
  BMxy = allxy(:,1:2);
  TREExy = allxy(:,3:4);
  BADxy = badxy(:,3:4);
  FIXxy = fixxy(:,3:4);

meanTREE=nanmean(TREExy);
meanBAD=nanmean(BADxy);
meanFIX=nanmean(FIXxy);
resTREE = TREExy - repmat(meanTREE,nobs,1);
resBAD = BADxy - repmat(nanmean(BADxy),nobs,1);
resFIX = FIXxy - repmat(nanmean(FIXxy),nobs,1);
sdevTREE = std(resTREE(:))
sdevBAD = std(resBAD(:))
sdevFIX = nanstd(resFIX(:))
meanBM=mean(BMxy);

sprintf('Mean BM position = %5.1f  %5.1f',meanBM)
sprintf('Mean TREE orig vals   = %5.1f  %5.1f',meanTREE)
sprintf('Mean TREE w/ bad vals = %5.1f  %5.1f',nanmean(BADxy))
sprintf('Mean TREE clean vals  = %5.1f  %5.1f',nanmean(FIXxy))

resBM = BMxy - repmat(meanBM,nobs,1);
sdevBM = std(resBM(:))

meanBMerr = sdevBM./sqrt(2.*nobs)
meanTREEerr = sdevTREE./sqrt(2.*nobs)
meanBADerr = sdevBAD./sqrt(2.*nobs)
meanFIXerr = sdevFIX./sqrt(2.*nobs - 2)

sdevBMxy = std(resBM)
sdevBMF = sdevBMxy(2).^2./sdevBMxy(1).^2
sdevTREExy = std(resTREE)
sdevTREEF = sdevTREExy(1).^2./sdevTREExy(2).^2
sdevBADxy = std(resBAD)
sdevTREEF = sdevBADxy(1).^2./sdevBADxy(2).^2
sdevFIXxy = nanstd(resFIX)
sdevFIXF = sdevFIXxy(1).^2./sdevFIXxy(2).^2



meanhorizTREE = sqrt(sum((meanTREE'-meanBM').^2))
meanhorizxyerrTREE = sqrt(meanBMerr.^2+meanTREEerr.^2)
meanhorizBAD = sqrt(sum((meanBAD'-meanBM').^2))
meanhorizxyerrBAD = sqrt(meanBMerr.^2+meanBADerr.^2)
meanhorizFIX = sqrt(sum((meanFIX'-meanBM').^2))
meanhorizxyerrFIX = sqrt(meanBMerr.^2+meanFIXerr.^2)

theta0 = round(atan2(TREEz0,horiz0)*180./pi*10)./10;

thetagrow = round(atan2(TREEz0+TREEgrow,horiz0)*180./pi*10)./10;

% generate some position noise
nobs = 4;
dtheta = randn(2*nobs,1)*10;

% want to reduce mess, so round to nearest 10cm for everything:
dtheta1 = round(dtheta(1:nobs)*10)./10;

dtheta2 = round(dtheta(nobs+1:2*nobs)*10)./10;

theta1 = theta0+dtheta1;
theta2 = thetagrow+dtheta2;

% these are the fixed exam values:
theta1 = [

   24.4000
   23.7000
   31.2000
   19.1000
   
]

theta2 = [

   22.2000
   28.4000
   34.1000
   28.1000
   
   ]

% angular means:
xr1 = sum(cos(theta1.*pi./180));
yr1 = sum(sin(theta1.*pi./180));

xr2 = sum(cos(theta2.*pi./180));
yr2 = sum(sin(theta2.*pi./180));

meantheta1 = atan2(sum(sin(theta1.*pi./180)),sum(cos(theta1.*pi./180)))*180./pi
meantheta2 = atan2(sum(sin(theta2.*pi./180)),sum(cos(theta2.*pi./180)))*180./pi

meanheight1TREE = meanhorizTREE.*tan(meantheta1.*pi./180)
meanheight1BAD = meanhorizBAD.*tan(meantheta1.*pi./180)
meanheight1FIX = meanhorizFIX.*tan(meantheta1.*pi./180)
meanheight2TREE = meanhorizTREE.*tan(meantheta2.*pi./180)
meanheight2BAD = meanhorizBAD.*tan(meantheta2.*pi./180)
meanheight2FIX = meanhorizFIX.*tan(meantheta2.*pi./180)


R1 = sqrt(xr1.^2+yr1.^2);
R2 = sqrt(xr2.^2+yr2.^2);

R1_bar = R1./nobs
R2_bar = R2./nobs

k1 = 50.25;
k2 = 50.25;

se1 = 1./(nobs.*R1_bar.*k1);
se2 = 1./(nobs.*R2_bar.*k2);

z0_95 = 1.96;

theta1_95 = se1.*z0_95*180./pi
theta2_95 = se2.*z0_95*180./pi

height_errTREE = sqrt((tan(meantheta1.*pi./180).*meanhorizxyerrTREE).^2 + theta1_95*pi./180./(cos(meantheta1.*pi./180).^2))
height_errBAD = sqrt((tan(meantheta1.*pi./180).*meanhorizxyerrBAD).^2 + theta1_95*pi./180./(cos(meantheta1.*pi./180).^2))
height_errFIX = sqrt((tan(meantheta1.*pi./180).*meanhorizxyerrFIX).^2 + theta1_95*pi./180./(cos(meantheta1.*pi./180).^2))



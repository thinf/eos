function dentropy = entropy_diff_F(s,t,p,th0,pr)

%%   entropy difference from differentiating the Gibbs potential in
%%   Feistel (2003), Prog. Ocean. 58, 43-114, and taking differences
%%
%%   usage        : dentropy = entropy_diff_F(s,t,p,th0,pr)
%%
%%   s            : salinity                           (psu)
%%   t            : in-situ temperature                (deg C, ITS-90)
%%   p            : gauge pressure                     (dbar)
%%                  (absolute pressure - 10.1325 dbar)
%%   th0          : potential temperature              (deg C, ITS-90) 
%%   pr           : reference pressure                 (dbar)
%%
%%   dentropy     : entropy(s,th0,pr)-entropy(s,t,p)   (kJ/kgK)
%%
%%   calls        : zcheck

%%   DRJ on 10/12/03


zcheck(s,t,p,th0,pr)


x2 = 2.5d-2*s; x = sqrt(x2); y = 2.5d-2*th0; z = 1.0d-4*pr; z1 = z;

fTp = -5.90578348518236 + y.*(24715.571866078 + ...
                    y.*(-2210.2236124548363 + y.*(592.743745734632 + ...
                     y.*(-290.12956292128547 + (113.90630790850321 - ...
                                       21.35571525415769*y).*y)))) + ...
                      z.*(270.983805184062 + z.*(-776.153611613101 + ...
                       z.*(196.51255088122 + z.*(-28.9796526294175 + ...
                 2.13290083518327*z)))) + y.*(z.*(-2910.0729080936 + ...
                     z.*(1513.116771538718 + z.*(-546.959324647056 + ...
                    (111.1208127634436 - 8.68841343834394*z).*z))) + ...
                 y.*(z.*(2017.52334943521 + z.*(-1498.081172457456 + ...
                    z.*(718.6359919632359 + z.*(-146.4037555781616 + ...
             4.9892131862671505*z)))) + y.*(z.*(-1591.873781627888 + ...
                     z.*(1207.261522487504 + z.*(-608.785486935364 + ...
           105.4993508931208*z))) + y.*(y.*(67.41756835751434*y.*z + ...
                      z.*(-381.06836198507096 + (133.7383902842754 - ...
                 49.023632509086724*z).*z)) + z.*(973.091553087975 + ...
                         z.*(-602.603274510125 + (276.361526170076 - ...
                                     32.40953340386105*z).*z))))));
                                 
gTp = y.*(-1858.920033948178 + y.*(781.281858144429 + ...
                      y.*(-388.6250910633612 + 87.18719211065*y))) + ...
                      z.*(-729.116529735046 + z.*(343.956902961561 + ...
                          z.*(-124.687671116248 + (31.656964386073 - ...
             7.04658803315449*z).*z))) + y.*(z.*(1721.528607567954 + ...
                      z.*(-674.819060538734 + z.*(356.629112415276 + ...
                      z.*(-88.4080716616 + 15.84003094423364*z)))) + ...
              y.*(y.*z.*(1190.914967948748 + z.*(-298.904564555024 + ...
                   145.9491676006352*z)) + z.*(-2082.7344423998043 + ...
                      z.*(614.668925894709 + z.*(-340.685093521782 + ...
                                           33.3848202979239*z))))); 
                                       
hTp = y.*(317.440355256842 + y.*(-202.5696441786141 + ...
                                              67.5605099586024*y)) + ...
                      z.*(175.292041186547 + z.*(-83.1923927801819 + ...
                29.483064349429*z)) + y.*(y.*(1380.9597954037708*z - ...
                    938.26075044542.*y.*z) + z.*(-766.116132004952 + ...
                    (108.3834525034224 - 51.2796974779828.*z).*z));
                        

y = 2.5d-2*t; z = 1.0d-4*p;

fTp = fTp +5.90578348518236 - y.*(24715.571866078 + ...
                    y.*(-2210.2236124548363 + y.*(592.743745734632 + ...
                     y.*(-290.12956292128547 + (113.90630790850321 - ...
                                       21.35571525415769*y).*y)))) - ...
                    ( z.*(270.983805184062 + z.*(-776.153611613101 + ...
                       z.*(196.51255088122 + z.*(-28.9796526294175 + ...
                 2.13290083518327*z)))) + y.*(z.*(-2910.0729080936 + ...
                     z.*(1513.116771538718 + z.*(-546.959324647056 + ...
                    (111.1208127634436 - 8.68841343834394*z).*z))) + ...
                 y.*(z.*(2017.52334943521 + z.*(-1498.081172457456 + ...
                    z.*(718.6359919632359 + z.*(-146.4037555781616 + ...
             4.9892131862671505*z)))) + y.*(z.*(-1591.873781627888 + ...
                     z.*(1207.261522487504 + z.*(-608.785486935364 + ...
           105.4993508931208*z))) + y.*(y.*(67.41756835751434*y.*z + ...
                      z.*(-381.06836198507096 + (133.7383902842754 - ...
                 49.023632509086724*z).*z)) + z.*(973.091553087975 + ...
                         z.*(-602.603274510125 + (276.361526170076 - ...
                                    32.40953340386105*z).*z))))))); 
                               
gTp = gTp - y.*(-1858.920033948178 + y.*(781.281858144429 + ...
                      y.*(-388.6250910633612 + 87.18719211065*y))) - ...
                    ( z.*(-729.116529735046 + z.*(343.956902961561 + ...
                          z.*(-124.687671116248 + (31.656964386073 - ...
             7.04658803315449*z).*z))) + y.*(z.*(1721.528607567954 + ...
                      z.*(-674.819060538734 + z.*(356.629112415276 + ...
                      z.*(-88.4080716616 + 15.84003094423364*z)))) + ...
              y.*(y.*z.*(1190.914967948748 + z.*(-298.904564555024 + ...
                   145.9491676006352*z)) + z.*(-2082.7344423998043 + ...
                      z.*(614.668925894709 + z.*(-340.685093521782 + ...
                                          33.3848202979239*z)))))); 
                                      
hTp = hTp - y.*(317.440355256842 + y.*(-202.5696441786141 + ...
                                              67.5605099586024*y)) - ...
                    ( z.*(175.292041186547 + z.*(-83.1923927801819 + ...
                29.483064349429*z)) + y.*(y.*(1380.9597954037708*z - ...
                    938.26075044542.*y.*z) + z.*(-766.116132004952 + ...
                   (108.3834525034224 - 51.2796974779828.*z).*z)));
               
kTp = 22.6683558512829*(z1-z);

 
dentropy = 2.5d-2*(fTp+x2.*(gTp+x.*hTp+x2.*kTp));


return

function entropy_diff_F(s,t,p,th0,pr)

!   entropy difference from differentiating the Gibbs potential in
!   Feistel (2003), Prog. Ocean. 58, 43-114, and taking differences
!
!   s                : salinity                           (psu)
!   t                : in-situ temperature                (deg C, ITS-90)
!   th0              : potential temperature              (deg C, ITS-90) 
!   p                : gauge pressure                     (dbar)
!                      (absolute pressure - 10.1325 dbar)
!   pr               : reference pressure                 (dbar)
!
!   entropy_diff     : entropy(s,th0,pr)-entropy(s,t,p)   (kJ/kgK)
!
!   DRJ on 10/12/03


implicit real*8(a-h,o-z)

real*8 kTp


x2 = 2.5d-2*s; x = sqrt(x2); y = 2.5d-2*th0; z = 1.0d-4*pr; z1 = z

fTp = -5.90578348518236d0 + y*(24715.571866078d0 + &
               y*(-2210.2236124548363d0 + y*(592.743745734632d0 + &
               y*(-290.12956292128547d0 + (113.90630790850321d0 - &
                                   21.35571525415769d0*y)*y))))
    
gTp = y*(-1858.920033948178d0 + y*(781.281858144429d0 + &
                y*(-388.6250910633612d0 + 87.18719211065d0*y)))
                 
hTp = y*(317.440355256842d0 + y*(-202.5696441786141d0 + &
                                         67.5605099586024d0*y))


if(z.ne.0.d0) then

     yz = y*z

     fTp = fTp + z*(270.983805184062d0 + z*(-776.153611613101d0 + &
                  z*(196.51255088122d0 + z*(-28.9796526294175d0 + &
            2.13290083518327d0*z)))) + y*(z*(-2910.0729080936d0 + &
                z*(1513.116771538718d0 + z*(-546.959324647056d0 + &
              (111.1208127634436d0 - 8.68841343834394d0*z)*z))) + &
             y*(z*(2017.52334943521d0 + z*(-1498.081172457456d0 + &
               z*(718.6359919632359d0 + z*(-146.4037555781616d0 + &
        4.9892131862671505d0*z)))) + y*(z*(-1591.873781627888d0 + &
                z*(1207.261522487504d0 + z*(-608.785486935364d0 + &
       105.4993508931208d0*z))) + y*(y*(67.41756835751434d0*y*z + &
                z*(-381.06836198507096d0 + (133.7383902842754d0 - &
            49.023632509086724d0*z)*z)) + z*(973.091553087975d0 + &
                   z*(-602.603274510125d0 + (276.361526170076d0 - &
                                 32.40953340386105d0*z)*z))))))

     gTp = gTp + z*(-729.116529735046d0 + z*(343.956902961561d0 + &
                    z*(-124.687671116248d0 + (31.656964386073d0 - &
         7.04658803315449d0*z)*z))) + y*(z*(1721.528607567954d0 + &
                 z*(-674.819060538734d0 + z*(356.629112415276d0 + &
                z*(-88.4080716616d0 + 15.84003094423364d0*z)))) + &
           y*(y*z*(1190.914967948748d0 + z*(-298.904564555024d0 + &
             145.9491676006352d0*z)) + z*(-2082.7344423998043d0 + &
                 z*(614.668925894709d0 + z*(-340.685093521782d0 + &
                                      33.3848202979239d0*z)))))     

     hTp = hTp + z*(175.292041186547d0 + z*(-83.1923927801819d0 + &
           29.483064349429d0*z)) + y*(y*(1380.9597954037708d0*z - &
                938.26075044542d0*y*z) + z*(-766.116132004952d0 + &
               (108.3834525034224d0 - 51.2796974779828d0*z)*z))

end if
                        

y = 2.5d-2*t; z = 1.0d-4*p

fTp = fTp +5.90578348518236d0 - y*(24715.571866078d0 + &
               y*(-2210.2236124548363d0 + y*(592.743745734632d0 + &
               y*(-290.12956292128547d0 + (113.90630790850321d0 - &
                                   21.35571525415769d0*y)*y))))

gTp = gTp - y*(-1858.920033948178d0 + y*(781.281858144429d0 + &
            y*(-388.6250910633612d0 + 87.18719211065d0*y)))
            
hTp = hTp - y*(317.440355256842d0 + y*(-202.5696441786141d0 + &
                                     67.5605099586024d0*y))

kTp = 22.6683558512829d0*(z1-z)


if(z.ne.0.d0) then

    yz = y*z

    fTp = fTp - ( z*(270.983805184062d0 + z*(-776.153611613101d0 + &
                   z*(196.51255088122d0 + z*(-28.9796526294175d0 + &
             2.13290083518327d0*z)))) + y*(z*(-2910.0729080936d0 + &
                 z*(1513.116771538718d0 + z*(-546.959324647056d0 + &
               (111.1208127634436d0 - 8.68841343834394d0*z)*z))) + &
              y*(z*(2017.52334943521d0 + z*(-1498.081172457456d0 + &
                z*(718.6359919632359d0 + z*(-146.4037555781616d0 + &
         4.9892131862671505d0*z)))) + y*(z*(-1591.873781627888d0 + &
                 z*(1207.261522487504d0 + z*(-608.785486935364d0 + &
        105.4993508931208d0*z))) + y*(y*(67.41756835751434d0*y*z + &
                 z*(-381.06836198507096d0 + (133.7383902842754d0 - &
             49.023632509086724d0*z)*z)) + z*(973.091553087975d0 + &
                    z*(-602.603274510125d0 + (276.361526170076d0 - &
                                 32.40953340386105d0*z)*z)))))))


    gTp = gTp - ( z*(-729.116529735046d0 + z*(343.956902961561d0 + &
                     z*(-124.687671116248d0 + (31.656964386073d0 - &
          7.04658803315449d0*z)*z))) + y*(z*(1721.528607567954d0 + &
                  z*(-674.819060538734d0 + z*(356.629112415276d0 + &
                 z*(-88.4080716616d0 + 15.84003094423364d0*z)))) + &
            y*(y*z*(1190.914967948748d0 + z*(-298.904564555024d0 + &
              145.9491676006352d0*z)) + z*(-2082.7344423998043d0 + &
                  z*(614.668925894709d0 + z*(-340.685093521782d0 + &
                                      33.3848202979239d0*z))))))

    hTp = hTp - ( z*(175.292041186547d0 + z*(-83.1923927801819d0 + &
            29.483064349429d0*z)) + y*(y*(1380.9597954037708d0*z - &
                 938.26075044542d0*y*z) + z*(-766.116132004952d0 + &
               (108.3834525034224d0 - 51.2796974779828d0*z)*z)))

end if


entropy_diff_F = 2.5d-2*(fTp+x2*(gTp+x*hTp+x2*kTp))


return
end

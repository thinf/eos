function rho = rho_F(s,t,p)

%%   in-situ density from differentiating the Gibbs potential in
%%   Feistel (2003), Prog. Ocean. 58, 43-114
%%
%%   usage        : rho = rho_F(s,t,p)
%%
%%   s            : salinity                           (psu)
%%   t            : in-situ temperature                (deg C, ITS-90)
%%   p            : gauge pressure                     (dbar)
%%                  (absolute pressure - 10.1325 dbar)
%%
%%   rho          : in-situ density                    (kg/m^3)
%%
%%   calls        : zcheck
%%
%%   check value  : rho_F(20,20,1000) = 1017.77590209665

%%   DRJ on 11/12/03


%zcheck(s,t,p)


x2 = 2.5d-2*s; x = sqrt(x2); y = 2.5d-2*t; z = 1.0d-4*p;

sv_tmp = 100015.695367145 + z.*(-5089.1530840726 + ...
                    z.*(853.5533353388611 + z.*(-133.2587017014444 + ...
                    (21.0131554401542 - 3.278571068826234*z).*z))) + ...
                     x2.*(-3310.49154044839 + z.*(769.588305957198 + ...
                        z.*(-289.5972960322374 + (63.3632691067296 - ...
                   13.1240078295496*z).*z)) + x.*(199.459603073901 + ...
                        x.*(-54.7919133532887 + 36.0284195611086*x - ...
                           22.6683558512829*y + (-8.16387957824522 - ...
                  90.52653359134831*z).*z) + z.*(-104.588181856267 + ...
                     (204.1334828179377 - 13.65007729765128*z).*z) + ...
                        y.*(-175.292041186547 + (166.3847855603638 - ...
                      88.449193048287*z).*z + y.*(383.058066002476 + ...
                       y.*(-460.319931801257 + 234.565187611355*y) + ...
                   z.*(-108.3834525034224 + 76.9195462169742*z)))) + ...
                      y.*(729.116529735046 + z.*(-687.913805923122 + ...
                      z.*(374.063013348744 + z.*(-126.627857544292 + ...
                    35.23294016577245*z))) + y.*(-860.764303783977 + ...
                      y.*(694.244814133268 + y.*(-297.728741987187 + ...
                     (149.452282277512 - 109.46187570047641*z).*z) + ...
                         z.*(-409.779283929806 + (340.685093521782 - ...
                   44.5130937305652*z).*z)) + z.*(674.819060538734 + ...
                           z.*(-534.943668622914 + (176.8161433232 - ...
             39.600077360584095*z).*z))))) + y.*(-270.983805184062 + ...
                      z.*(1552.307223226202 + z.*(-589.53765264366 + ...
                     (115.91861051767 - 10.664504175916349*z).*z)) + ...
                      y.*(1455.0364540468 + z.*(-1513.116771538718 + ...
                     z.*(820.438986970584 + z.*(-222.2416255268872 + ...
                     21.72103359585985*z))) + y.*(-672.50778314507 + ...
                     z.*(998.720781638304 + z.*(-718.6359919632359 + ...
                     (195.2050074375488 - 8.31535531044525*z).*z)) + ...
                      y.*(397.968445406972 + z.*(-603.630761243752 + ...
                      (456.589115201523 - 105.4993508931208*z).*z) + ...
                      y.*(-194.618310617595 + y.*(63.5113936641785 - ...
                        9.63108119393062*y + z.*(-44.5794634280918 + ...
                      24.511816254543362*z)) + z.*(241.04130980405 + ...
               z.*(-165.8169157020456 + 25.92762672308884*z)))))));


rho = 1d+8*ones(size(s))./sv_tmp;


%    Note: specific volume = 1.0d-8*sv_tmp


return

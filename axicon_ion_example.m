%% Parameter Deck

% Computation parameters
input.n_pts  = 4096;   % number of pixels
input.res    = 3.75;   % resolution in image plane (microns)
input.nz     = 101;    % number of points in z
input.zmin   = 2.00e6; % starting z position (microns)
input.zmax   = 4.00e6; % ending z position (microns)

% Ti:Saph parameters
input.lambda = 0.800;   % wavelength (microns)
input.t0     = 100e-15; % pulse width (s)
input.e0     = 40e-3;   % pulse energy (J)
input.eta    = 0.49;    % transmission efficieny
input.r0     = 2.0;     % laser radius (cm)

% Optic parameters
input.type   = 'axicon';  % can choose from 'axicon', 'axilens', and 'kinoform'
input.R      = 20.0e3;    % illuminated radius of mask (microns)
input.f0     = 3e6;       % distance to axilens focus (microns) [if type==axilens]
input.Dz     = 1e6;       % length of axilens focus (microns) [if type==axilens]
input.ax_ang = 0.6;       % axicon angle (degrees) [if type==axicon]
input.gamma  = 4.1e-3;    % convergence angle (radians) [if type==kinoform]
input.m      = 8;         % bessel order [if type==kinoform]

% Illumination parameters
input.illum  = 'tophat'; % options are 'tophat' which is an order 30 super gaussian, . . . 
                         % 'gaussian', 'mask' which has a hard edge, and 'flat' which is an infinite beam
input.sigma  = 20.5e3;   % sigma of gaussian/super gaussian or radius of mask (microns)

% Aberation parameters
input.zern_amp = 2e-4;% amplitude of aberation
input.zern_m   = 0;   % add beam aberations with Zernike polynomials, for example . . .
input.zern_n   = 0;   % m = 2, n = 2 is a vertical astigmatism. 0,0 is no aberation. For more, see . . .
                      % https://en.wikipedia.org/wiki/Zernike_polynomials#Zernike_polynomials

% Other stuff
input.Z_ion  = 1;    % number of electrons ionized
input.E_ion  = 5.39; % 1st ionization energy (5.39 eV for Lithium, 13.6 eV for hydrogen)
input.store_all = 0; % keep all transverse images (a lot of data)!

%% Calculate output intensity

output = Fresnel_Prop(input);

%% Plot data
save_dir = 'plots/axicon_06_ion_frac/';
save_bool = 1;
plot_window = 150;

plot_fun(input,output,'3D',plot_window,1,save_bool,save_dir);
plot_fun(input,output,'IZ',plot_window,2,save_bool,save_dir);
plot_fun(input,output,'IR',plot_window,3,save_bool,save_dir);
plot_fun(input,output,'IonContour',plot_window,4,save_bool,save_dir);
plot_fun(input,output,'IntContour',plot_window,5,save_bool,save_dir);
plot_fun(input,output,'Image',plot_window,6,save_bool,save_dir);
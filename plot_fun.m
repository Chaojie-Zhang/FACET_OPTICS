function fig = plot_fun(input,output,plot_type,plot_window,fig,save_bool,save_dir)

if nargin < 4
    low = 1;
    high = input.n_pts;
else
    mid = input.n_pts/2;
    low  = mid - plot_window;
    high = mid + plot_window;
end

if nargin < 5
    fig = 1;
end

if nargin < 7
    save_bool = 0;
    save_dir = '';
end

if ~exist(save_dir,'dir') && save_bool
    mkdir(save_dir);
end

cmap = custom_cmap;

figure(fig);

if strcmp(plot_type,'3D')
    surf(output.x_axis(low:high),output.z_axis/1e4,output.Int_line(:,low:high)/1e15); shading flat; axis tight; colormap(cmap.wbgyr);
    xlabel('R [\mum]');
    ylabel('Z [cm]');
    zlabel('I [10^{15} W/cm^2]');
    set(gca,'fontsize',14);
    if save_bool; saveas(gcf,[save_dir 'Intensity_3D.png']); end;
end

if strcmp(plot_type,'IZ')
    plot(output.z_axis/1e4,output.Int_max/1e15,'k','linewidth',2); axis tight;
    xlabel('Z [cm]');
    ylabel('I [10^{15} W/cm^2]');
    set(gca,'fontsize',14);
    if save_bool; saveas(gcf,[save_dir 'Intensity_vs_Z.png']); end;
end

if strcmp(plot_type,'IR')
    z_ind = round(numel(output.z_axis)/2);
    plot(output.x_axis(low:high)/1e4,output.Int_line(z_ind,low:high)/1e15,'k','linewidth',2); axis tight;
    xlabel('R [\mum]');
    ylabel('I [10^{15} W/cm^2]');
    set(gca,'fontsize',14);
    if save_bool; saveas(gcf,[save_dir 'Intensity_vs_R.png']); end;
end

if strcmp(plot_type,'IntThresh')
    plot(output.z_axis/1e4,output.r_thresh,'k','linewidth',2); axis tight;
    xlabel('Z [cm]');
    ylabel('Ionizied Diameter [\mum]');
    set(gca,'fontsize',14);
    if save_bool; saveas(gcf,[save_dir 'Radial_Intensity_Threshold.png']); end;
end

if strcmp(plot_type,'IntContour')
    v = linspace(0,input.thresh,10);
    contourf(output.x_axis(low:high),output.z_axis/1e4,output.Int_line(:,low:high),v); colormap(cmap.wbgyr); c = colorbar;
    xlabel('R [\mum]');
    ylabel('Z [cm]');
    ylabel(c,'I [W/cm^2]');
    set(gca,'fontsize',14);
    if save_bool; saveas(gcf,[save_dir 'Intensity_Contour.png']); end;
end

if strcmp(plot_type,'IonContour')
    v = linspace(0,input.thresh,10);
    contourf(output.x_axis(low:high),output.z_axis/1e4,output.Int_line(:,low:high),v); colormap(cmap.wbgyr); c = colorbar;
    xlabel('R [\mum]');
    ylabel('Z [cm]');
    ylabel(c,'I [W/cm^2]');
    set(gca,'fontsize',14);
    if save_bool; saveas(gcf,[save_dir 'Ionization_Contour.png']); end;
end
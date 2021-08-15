using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using PracticalTest.Domain.Entity.General;
using PracticalTest.Domain.Interface.Repositories.Category;
using PracticalTest.Domain.Interface.Repositories.Product;
using PracticalTest.Domain.Interface.Services.Category;
using PracticalTest.Domain.Interface.Services.Product;
using PracticalTest.Repository.Category;
using PracticalTest.Repository.Product;
using PracticalTest.Service.Category;
using PracticalTest.Service.Product;

namespace PracticalTest.Web
{
    public class Startup
    {
        AppConfig _cfg;
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            _cfg = new AppConfig();
            _cfg.DbConnectinString = configuration.GetConnectionString("SqlServer");
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<ICategoryRepository, CategoryRepository>();
            services.AddTransient<ICategoryService, CategoryService>();
            services.AddTransient<IProductRepository, ProductRepository>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IDbConnection>((sp) => new SqlConnection(_cfg.DbConnectinString));
            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Product}/{action=Product}/{id?}");
            });
        }
    }
}

 require 'fileutils'

 Shoes.app title: "OrdenApp" do

   stack(margin: 6) {
      background "FF5722" .. "#222831"
      title "OrdenApp", :align => 'center', stroke: white
      para " La mejor forma de ordenar tus carpetas y archivos", :align => 'center', stroke: white
    
      @b1 = button "Ordename!!", :width =>90 , :height => 30
      @b1.move(250,300)
      @b2= button "Selecciona Carpeta a Ordenar", :width => 220
      @b2.move(180,140)
      @b2.click(){
      @folder = ask_open_folder
      stack do
      @ruta_carpeta= para @folder, :align =>'center', :height => 200
      @ruta_carpeta.move(0,200)
      end
      }

      @b1.click(){

         ruta_destino = @folder
         Dir.chdir(ruta_destino)
         FileUtils::mkdir_p "pdf's"
         FileUtils::mkdir_p "zip_rar_targz"
         FileUtils::mkdir_p "ejecutables"
         FileUtils::mkdir_p "documentos"
         FileUtils::mkdir_p "otros"
         FileUtils::mkdir_p "imagenes"
         @vector = Array.new
         @otros = Array.new
         @rar = Array.new
         @pdf = Array.new
         @docu = Array.new
         @ima= Array.new
         Dir.glob("*.*").each do |nombres|
            @vector <<nombres
            if /.\.rar/.match(nombres)
               @rar <<nombres
            elsif /.\.zip/.match(nombres)
               @rar <<nombres
            elsif /.\.tar./.match(nombres)
               @rar <<nombres
            elsif /.\.pdf/.match(nombres)
               @pdf <<nombres
            elsif /.\.docx/.match(nombres)
               @docu <<nombres
            elsif /.\.doc/.match(nombres)
               @docu <<nombres
            elsif /.\.pptx/.match(nombres)
               @docu <<nombres
            elsif /.\.txt/.match(nombres)
               @docu <<nombres
            elsif /.\.png/.match(nombres)
               @ima <<nombres
            elsif /.\.jpg/.match(nombres)
               @ima <<nombres
            else
               @otros <<nombres
            end
         end

      @otros.each do |nomb|

         FileUtils.mv ruta_destino + "/" + nomb, ruta_destino + "/otros"
      end
      @rar.each do |nomb|

         FileUtils.mv ruta_destino + "/" + nomb, ruta_destino + "/zip_rar_targz"
      end
      @pdf.each do |nomb|

         FileUtils.mv ruta_destino + "/" + nomb, ruta_destino + "/pdf's"
      end
      @docu.each do |nomb|

         FileUtils.mv ruta_destino + "/" + nomb, ruta_destino + "/documentos"
      end
      @ima.each do |nomb|

         FileUtils.mv ruta_destino + "/" + nomb, ruta_destino + "/imagenes"
      end
      alert("Carpeta fue ordenada correctamente!")
      }
   }
 
 end
 require 'fileutils'

 Shoes.app title: "OrdenApp" do

   stack(margin: 6) {
      background "FF5722" .. "#222831"
      title "OrdenApp", :align => 'center', stroke: white
      para " La mejor forma de ordenar tus carpetas y archivos", :align => 'center', stroke: white
    
      @caja= edit_line width: 300
      @caja.move(150,150)
      @b1 = button "Ordename!!", :width =>90 , :height => 30
      @b1.move(250,250)
      @bajada = para "Ingresa la ruta de la carpeta a ordenar", :align=> 'center'
      @bajada.move(0, 190)

      @b1.click(){


      	ruta = pwd()
         ruta_destino = @caja.text()
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

         FileUtils.mv ruta + "/" + nomb, ruta + "/otros"
      end
      @rar.each do |nomb|

         FileUtils.mv ruta + "/" + nomb, ruta + "/zip_rar_targz"
      end
      @pdf.each do |nomb|

         FileUtils.mv ruta + "/" + nomb, ruta + "/pdf's"
      end
      @docu.each do |nomb|

         FileUtils.mv ruta + "/" + nomb, ruta + "/documentos"
      end
      @ima.each do |nomb|

         FileUtils.mv ruta + "/" + nomb, ruta + "/documentos"
      end
      alert("Carpeta fue ordenada correctamente!")
      }
   }
 
 end
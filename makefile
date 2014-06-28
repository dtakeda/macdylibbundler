dylibbundler:
	g++ -c -I./src ./src/Settings.cpp -o ./Settings.o
	g++ -c -I./src ./src/DylibBundler.cpp -o ./DylibBundler.o
	g++ -c -I./src ./src/Dependency.cpp -o ./Dependency.o
	g++ -c -I./src ./src/main.cpp -o ./main.o
	g++ -c -I./src -I/opt/local/include ./src/Utils.cpp -o ./Utils.o
	g++ -o ./dylibbundler ./Settings.o ./DylibBundler.o ./Dependency.o ./main.o ./Utils.o /opt/local/lib/libboost_filesystem-mt.dylib /opt/local/lib/libboost_system-mt.dylib

clean:
	rm -f *.o
	rm -f ./dylibbundler
	
install: dylibbundler
	cp ./dylibbundler /usr/local/bin/dylibbundler
	chmod 775 /usr/local/bin/dylibbundler

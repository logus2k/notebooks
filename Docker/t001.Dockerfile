# Downloads the specified image and creates a new container based on this image.
FROM mcr.microsoft.com/dotnet/core/sdk:2.2

# Sets the current working directory in the container, used by the subsequent commands.
WORKDIR /app

# Copies files from the host computer to the container. The first argument (myapp_code) is a file or folder on the host computer. The second argument (.) specifies the name of the file or folder to act as the destination in the container. In this case, the destination is the current working directory (/app).
COPY myapp_code .

# Executes a command in the container. Arguments to the RUN command are command-line commands.
RUN dotnet build -c Release -o /rel

# Creates configuration in the new image that specifies which ports are intended to be opened when the container is run. If the container is running a web app, it's common to EXPOSE port 80.
EXPOSE 80

# Sets the current working directory in the container, used by the subsequent commands.
WORKDIR /rel

# Specifies the operation the container should run when it starts. In this example, it runs the newly built app. You specify the command to be run and each of its arguments as a string array.
ENTRYPOINT ["dotnet", "myapp.dll"]

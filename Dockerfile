FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2

WORKDIR /app

COPY ExamplePlugin/ .
COPY Steamless/ .
COPY Steamless.API/ .
COPY Steamless.CLI/ .
COPY Steamless.Unpacker.Variant20.x86/ .
COPY Steamless.Unpacker.Variant30.x64/ .
COPY Steamless.Unpacker.Variant30.x86/ .
COPY Steamless.Unpacker.Variant31.x64/ .
COPY Steamless.Unpacker.Variant31.x86/ .
RUN dotnet restore
RUN dotnet build -c Release -o out
ENTRYPOINT ["/app/out/Steamless.exe"]

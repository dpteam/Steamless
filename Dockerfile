FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2

WORKDIR /app

COPY ExamplePlugin/ ./Steamless/ExamplePlugin
COPY Steamless/ ./Steamless/Steamless
COPY Steamless.API/ ./Steamless/Steamless.API
COPY Steamless.CLI/ ./Steamless/Steamless.CLI
COPY Steamless.Unpacker.Variant20.x86/ ./Steamless/Steamless.Unpacker.Variant20.x86
COPY Steamless.Unpacker.Variant30.x64/ ./Steamless/Steamless.Unpacker.Variant30.x64
COPY Steamless.Unpacker.Variant30.x86/ ./Steamless/Steamless.Unpacker.Variant30.x86
COPY Steamless.Unpacker.Variant31.x64/ ./Steamless/Steamless.Unpacker.Variant31.x64
COPY Steamless.Unpacker.Variant31.x86/ ./Steamless/Steamless.Unpacker.Variant31.x86
RUN nuget restore ./Steamless/
RUN msbuild /p:Configuration=Release /p:OutputPath=C:\app\out\

ENTRYPOINT ["/app/out/Steamless.exe"]

FROM python:3.12
RUN wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
RUN bash Miniforge3-$(uname)-$(uname -m).sh -b -p "/conda"
ENV PATH="/conda/bin:${PATH}"
WORKDIR /app
COPY environment.yml .
RUN mamba init 
RUN mamba env update -n base -f environment.yml 
CMD ["tail",  "-f", "/dev/null"]
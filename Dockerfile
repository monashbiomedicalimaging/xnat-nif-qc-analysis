FROM monashbiomedicalimaging/nianalysis
MAINTAINER Tom Close <tom.close@monash.edu>

# Download QA script to run
ENV REFRESHED_AT 2018-03-02-09:41
RUN git clone https://github.com/mbi-image/xnat-nif-qc-analysis.git /repo
ENV PYTHONPATH /repo:$PYTHONPATH

# Set the analysis script as the "entrypoint" the script run by 'docker run'
ENTRYPOINT /repo/xnat_pipeline.sh

# XNAT container pipeline label
LABEL org.nrg.commands="[{\"index\": null, \"working-directory\": null, \"description\": \"Analyses QC sessions acquired as per the NIF TDRS SOP\", \"command-line\": \"#SESSION# #T1# #T2# #DMRI#\", \"inputs\": [{\"command-line-flag\": null, \"name\": \"T1 32Ch Scan Name\", \"default-value\": \"\", \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#T1#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Name of the T1-weighted saline phantom with 32 Channel Head Coil\"}, {\"command-line-flag\": null, \"name\": \"T2 32Ch Scan Name\", \"default-value\": \"\", \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#T2#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Name of the T2-weighted saline phantom with 32 Channel Head Coil\"}, {\"command-line-flag\": null, \"name\": \"dMRI 32Ch Scan Name\", \"default-value\": \"\", \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#DMRI#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Name of the Diffusion MRI saline phantom with 32 Channel Head Coil\"}], \"outputs\": [], \"image\": \"monashbiomedicalimaging/xnat-nif-qc-analysis\", \"label\": null, \"version\": \"1.0\", \"info-url\": null, \"xnat\": [{\"derived-inputs\": [], \"contexts\": [\"xnat:imageSessionData\"], \"description\": \"Analyses QC sessions acquired as per the NIF TDRS SOP\", \"output-handlers\": [], \"external-inputs\": [{\"name\": \"session\", \"load-children\": false, \"required\": true, \"replacement-key\": \"#SESSION#\", \"type\": \"Session\", \"description\": \"Input session\"}], \"name\": \"QC Analysis\"}], \"mounts\": [{\"writable\": true, \"path\": \"/workdir\", \"name\": \"workdir\"}], \"schema-version\": \"1.0\", \"environment-variables\": {}, \"type\": \"docker\", \"ports\": {}, \"name\": \"QC Analysis\"}]"

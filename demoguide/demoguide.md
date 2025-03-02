[comment]: <> (please keep all comment items at the top of the markdown file)
[comment]: <> (please do not change the ***, as well as <div> placeholders for Note and Tip layout)
[comment]: <> (please keep the ### 1. and 2. titles as is for consistency across all demoguides)
[comment]: <> (section 1 provides a bullet list of resources + clarifying screenshots of the key resources details)
[comment]: <> (section 2 provides summarized step-by-step instructions on what to demo)


[comment]: <> (this is the section for the Note: item; please do not make any changes here)
***
### EShopOnWeb Retail in ACI - demo scenario

<div style="background: lightgreen; 
            font-size: 14px; 
            color: black;
            padding: 5px; 
            border: 1px solid lightgray; 
            margin: 5px;">

**Note:** Below demo steps should be used **as a guideline** for doing your own demos. Please consider contributing to add additional demo steps.
</div>

[comment]: <> (this is the section for the Tip: item; consider adding a Tip, or remove the section between <div> and </div> if there is no tip)

<div style="background: lightblue; 
            font-size: 14px; 
            color: black;
            padding: 5px; 
            border: 1px solid lightgray; 
            margin: 5px;">

**Tip:** The same **EShopOnWeb Retail** application is also available in the **IAAS, PAAS and AKS scenarios**. If you want to walk learners through the different Azure Architectures, running the same application workload, it's a quite powerful demo.
</div>

***
### 1. What Resources are getting deployed
This scenario deploys the sample **.NET EShopOnWeb Retail** application as a running **Azure Container Instance**, together with **Azure Container Registry**. 

* MTTDemoDeployRGc%youralias%ACI_EShop - Azure Resource Group.
* %youralias%eshopacr with eshopwebmvc container image - Azure Container Registry
* %youralias%-aci-eshoponweb-app - Running Azure Container Instance

<img src="https://raw.githubusercontent.com/maartenvandiemen/AZD-ACI-Demo/refs/heads/main/demoguide/img/ResourceGroup_Overview.png" alt="ACI_EShop Resource Group" style="width:70%;">
<br></br>

<img src="https://raw.githubusercontent.com/maartenvandiemen/AZD-ACI-Demo/refs/heads/main/demoguide/img/eshopacr.png" alt="ACI_EShop Azure Container Registry" style="width:70%;">
<br></br>

<img src="https://raw.githubusercontent.com/maartenvandiemen/AZD-ACI-Demo/refs/heads/main/demoguide/img/eshopaci.png" alt="ACI_EShop Azure Container Instance" style="width:70%;">
<br></br>

### 2. What can I demo from this scenario after deployment

1. Navigate to the **deployed ACI container / Overview** blade. 
1. Show the container is **running** and highlight the **public IP address**.
1. **Copy** the public IP address and **navigate** to the EShopOnWeb Retail application from your browser.

<img src="https://raw.githubusercontent.com/maartenvandiemen/AZD-ACI-Demo/refs/heads/main/demoguide/img/eshoponwebsite.png" alt="ACI_EShop Azure Container Instance" style="width:70%;">
<br></br>

1. Navigate to **Settings / Containers**
1. From the **Events**, explain the different actions for getting the container up and running. (pull from registry, started container,...)
1. From the **Properties**, show the ports, as well as the CPU/Memory settings used for this ACI
1. From the **Logs**, highlight how this reflects the "console" logging from the web server 
1. From the **Connect** option, Connect to the bash prompt of the Linux-OS container hosting the web app. 
1. **Run "ls" or "dir" command** to display the application code files and folders

1. Navigate to **Monitoring/Metrics**
1. Show how the CPU load is rather flat at the start of the container, next having a little spike to about 10% load, followed by a drop once the workload is up-and-running
1. Feel free to ask the audience to connect to the public IP address, click around in the EShop, order something (demo accounts is provided in the app), and see how this impacts CPU load

1. Navigate to the **Overview** tab
1. Show the **Restart / Stop / Refresh** buttons
1. **Stop** the container
1. After a few seconds, show the container is stopped. Next, click the **Start** button
1. Once the container is running again, emphasize the IP address changed. This is because it created a new instance from the registry container image.


[comment]: <> (this is the closing section of the demo steps. Please do not change anything here to keep the layout consistant with the other demoguides.)
<br></br>
***
<div style="background: lightgray; 
            font-size: 14px; 
            color: black;
            padding: 5px; 
            border: 1px solid lightgray; 
            margin: 5px;">

**Note:** This is the end of the current demo guide instructions.
</div>

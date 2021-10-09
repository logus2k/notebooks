
# Gather the requirements

Before planning your network IP address scheme, you must gather the requirements for your infrastructure. These requirements also will help you prepare for future growth by reserving extra IP addresses and subnets.

Here are two of the questions you might ask to discover the requirements:

* How many devices do you have on the network?
* How many devices are you planning to add to the network in the future?
* When your network expands, you don't want to redesign the IP address scheme. Here are some other questions you could ask:

Based on the services running on the infrastructure, what devices do you need to separate?

* How many subnets do you need?
* How many devices per subnet will you have?
* How many devices are you planning to add to the subnets in the future?
* Are all subnets going to be the same size?
* How many subnets do you want or plan to add in future?

You'll need to isolate some services. Isolation of services provides an additional layer of security, but also requires good planning. For example, your front-end servers can be accessed by public devices, but the back-end servers need to be isolated. Subnets help isolate the network in Azure. However, by default, all subnets within a virtual network can communicate with each other in Azure. To provide further isolation, you can use a __Network Security Group__. You might isolate services depending on the data and its security requirements. For example, you might choose to isolate HR data and the company's financial data from customer databases.

When you know the requirements, you'll have a greater understanding of the total number of devices on the network per subnet and how many subnets you'll need. CIDR allows more flexible allocation of IP addresses than was possible with the original system of IP address classes. Depending on your requirements, you'll slice the IP block into the required subnets and hosts.

Remember that Azure uses the first three addresses on each subnet. The first and last IP addresses of the subnets also are reserved for protocol conformance. Therefore, the number of possible addresses on an Azure subnet is (2^n)-5, where n represents the number of host bits.

## Example

The CoreServicesVnet virtual network is deployed in the US West region. This virtual network will have the largest number of resources. It will have connectivity to on-premises networks through a VPN connection. This network will have web services, databases, and other systems that are key to the operations of the business. Shared services, such as domain controllers and DNS also will be located here. A large amount of growth is anticipated, so a large address space is necessary for this virtual network.

The ManufacturingVnet virtual network is deployed in the North Europe region, near the location of your organization's manufacturing facilities. This virtual network will contain systems for the operations of the manufacturing facilities. The organization is anticipating a large number of internal connected devices for their systems to retrieve data from, such as temperature, and will need an IP address space that it can expand into.

The ResearchVnet virtual network is deployed in the West India region, near the location of the organization's research and development team. The research and development team uses this virtual network. The team has a small, stable set of resources that is not expected to grow. The team needs a small number of IP addresses for a few virtual machines for their work.

![IP Addressing Planning Example](images\ip_addressing_planning_example.png "IP Addressing Planning Example")

1) Create the CoreServicesVnet virtual network and subnets

   1.1) Create the CoreServicesVnet virtual network:

       az network vnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --name CoreServicesVnet \
        --address-prefixes 10.20.0.0/16 \
        --location westus

   1.2) Create the subnets we need for the planned resources in the virtual network:

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name CoreServicesVnet \
        --name GatewaySubnet \
        --address-prefixes 10.20.0.0/27

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name CoreServicesVnet \
        --name SharedServicesSubnet \
        --address-prefixes 10.20.10.0/24

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name CoreServicesVnet \
        --name DatabaseSubnet \
        --address-prefixes 10.20.20.0/24

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name CoreServicesVnet \
        --name PublicWebServiceSubnet \
        --address-prefixes 10.20.30.0/24

   1.3) Show all the configured subnets:

       az network vnet subnet list \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name CoreServicesVnet \
        --output table

2) Create the ManufacturingVnet virtual network and subnets

   2.1) Create the ManufacturingVnet virtual network:

       az network vnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --name ManufacturingVnet \
        --address-prefixes 10.30.0.0/16 \
        --location northeurope

   2.2) Create the subnets we need for the planned resources in the virtual network:

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ManufacturingVnet \
        --name ManufacturingSystemSubnet \
        --address-prefixes 10.30.10.0/24

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ManufacturingVnet \
        --name SensorSubnet1 \
        --address-prefixes 10.30.20.0/24

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ManufacturingVnet \
        --name SensorSubnet2 \
        --address-prefixes 10.30.21.0/24

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ManufacturingVnet \
        --name SensorSubnet3 \
        --address-prefixes 10.30.22.0/24

   2.3) Show all the configured subnets:

       az network vnet subnet list \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ManufacturingVnet \
        --output table

3) Create the ResearchVnet virtual network and subnets

   3.1) Create the ResearchVnet virtual network:

       az network vnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --name ResearchVnet \
        --address-prefixes 10.40.40.0/24 \
        --location westindia

   3.2) Create the subnets we need for the planned resources in the virtual network:

       az network vnet subnet create \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ResearchVnet \
        --name ResearchSystemSubnet \
        --address-prefixes 10.40.40.0/24

   3.3) Show all the configured subnets:

       az network vnet subnet list \
        --resource-group learn-1437b7d1-608e-4467-a8aa-35b5cb8aa265 \
        --vnet-name ResearchVnet \
        --output table

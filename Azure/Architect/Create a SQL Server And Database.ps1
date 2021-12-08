

# Set up some variables for creation of the SQL Database server
$serverName = "erpserver-$(Get-Random)"
$location = $(Get-AzResourceGroup -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506).location
$sqlAdmin = Get-Credential -credential dbadmin

# Create a SQL Database server to store the database
New-AzSqlServer `
    -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506 `
    -Location $location `
    -ServerName $serverName `
    -SqlAdministratorCredentials $sqlAdmin

# Create a database
New-AzSqlDatabase `
    -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506 `
    -ServerName $serverName `
    -DatabaseName sql-erp-db

# Examine a long-term retention policy (LTR)
Get-AzSqlDatabase `
    -ResourceGroupName <ResourceGroupName> `
    -ServerName <ServerName> `
    | Get-AzSqlDatabaseLongTermRetentionPolicy

# Configure the policy
Set-AzSqlDatabaseBackupLongTermRetentionPolicy `
    -ServerName <ServerName> `
    -DatabaseName <DatabaseName> `
    -ResourceGroupName <ResourceGroupName> `
    -WeeklyRetention P10W `
    -YearlyRetention P3Y `
    -WeekOfYear 1

# Get SQL Server name
$sqlserver=Get-AzSqlServer

# View long-term retention policies for the database server
Get-AzSqlDatabase `
    -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506 `
    -ServerName $sqlserver.ServerName `
    | Get-AzSqlDatabaseLongTermRetentionPolicy

# Configure a long-term retention policy
Set-AzSqlDatabaseBackupLongTermRetentionPolicy `
    -ServerName $sqlserver.ServerName `
    -DatabaseName sql-erp-db `
    -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506 `
    -WeeklyRetention P8W `
    -MonthlyRetention P12M `
    -YearlyRetention P5Y `
    -WeekOfYear 1

# Check that the new policy has been applied
Get-AzSqlDatabaseBackupLongTermRetentionPolicy `
    -ServerName $sqlserver.ServerName `
    -DatabaseName sql-erp-db `
    -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506

# Validate that continuous backups are running
Get-AzSqlDatabaseRestorePoint `
    -ResourceGroupName learn-d3f9afea-3874-4ee6-8899-bd86c14af506 `
    -DatabaseName sql-erp-db `
    -ServerName $sqlserver.ServerName

# Check the tables in the database
# SELECT schema_name(t.schema_id) as schema_name,
#     t.name as table_name
# FROM sys.tables t
# ORDER BY schema_name, table_name;


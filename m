Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BEB200954
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jun 2020 15:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731687AbgFSNCG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 Jun 2020 09:02:06 -0400
Received: from mail-eopbgr150045.outbound.protection.outlook.com ([40.107.15.45]:55893
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732809AbgFSNBx (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Jun 2020 09:01:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXOvBzdwtDxJ4uZTNmQqFKi6xVEFjKGgvGkY8w+1gcYMUzqziQBce078ScqR/J3msr95tcytKan8DzvzN+Czgpnrqds7IOHeFijFz/viwdJ16HA3iARzBKiNiZeFnR3SZtHFkkrQi8YiHR54a4JbCIVFdJYP66mhJgpmx/IPAaeyXqWAQ8yS6vv/q3rFTVjl0V641yjUhG4pCeQvrrm9KNbLeJVYm2Ht8fQp4zWc20ptzXF1+XAOl41HfiMAIqJZNpIh/1bJ3L7CIKu4FV+darWiRGXv1qRqthBF3kZQkZZLu+jhk8LKvnt8C6b5e2CHNT5f3hGKs3Oue6ofzKma4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FAJ23ZPMQuSyoi/VLPM6PnQ9ZS6rxZwIEFtJri6DtI=;
 b=eC+KnZ0PP0uQK5IHRXKbjeOrgHQmVMT+fgJ6nZdoQnPJrSh0ySrp4NZ/m7io5boX+6L8hF2LVOAxLEdYs7vKWMrhQsdBl6FbcWkICsegzB8Rn1Eem4ihAf3fqAoUXBTIAkiJ/E2wPRqpAQ0AU6jwha17UEUp3OYRnWtyBPpAPO01ULcZkSH2ANeKDQd2bBA9OZ8TbjP+q0pHrBhdforgxwttJTo/l39gGPqSqq/DOevH7G6NsgfIYFY1RchijxMbkfJr9pUCn5LxslGlpsowLzxCt6awDB7NN8JuumMjtlfsE7rTVdDlShYUMdwltixN+On1COS8fFHye5BnfuNSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FAJ23ZPMQuSyoi/VLPM6PnQ9ZS6rxZwIEFtJri6DtI=;
 b=ed4Lc3Bw+GCrUpj7R9naEw/Gshf0kCoVVREhHY9InTMRlD9Vn9xakioYNWDWQJfyGiakuNZZuE5Zut14QwO7MwnlaHh0xbDBs80K2EZtMUio2v1mLOlIh7k8wUk04c+WorhDf2k7BFxljjRDXluyIOjGpllCRSdfB+0SPL4tKpQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=mellanox.com;
Received: from AM0PR05MB6754.eurprd05.prod.outlook.com (2603:10a6:20b:15a::7)
 by AM0PR05MB5745.eurprd05.prod.outlook.com (2603:10a6:208:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 13:01:49 +0000
Received: from AM0PR05MB6754.eurprd05.prod.outlook.com
 ([fe80::c0cc:a656:610c:88f2]) by AM0PR05MB6754.eurprd05.prod.outlook.com
 ([fe80::c0cc:a656:610c:88f2%3]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 13:01:49 +0000
Date:   Fri, 19 Jun 2020 16:01:47 +0300
From:   Ido Schimmel <idosch@mellanox.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mlxsw: spectrum: Adjust headroom buffers for 8x
 ports
Message-ID: <20200619130147.GA400150@splinter>
References: <20200619100907.GA246319@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619100907.GA246319@mwanda>
X-ClientProxiedBy: AM0PR04CA0045.eurprd04.prod.outlook.com
 (2603:10a6:208:1::22) To AM0PR05MB6754.eurprd05.prod.outlook.com
 (2603:10a6:20b:15a::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (193.47.165.251) by AM0PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:208:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Fri, 19 Jun 2020 13:01:49 +0000
X-Originating-IP: [193.47.165.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fea85e49-c58c-4e8b-5023-08d81450ee0f
X-MS-TrafficTypeDiagnostic: AM0PR05MB5745:
X-Microsoft-Antispam-PRVS: <AM0PR05MB5745F3CDE99731D6F02B3905BF980@AM0PR05MB5745.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ULLipAR97RlX7b71ZWu9bykGgePnCJW5ucDsHUQhRtZnhkIvNycl4aSbqVrWJIkcNPVzNT5hUnQcDkGR5pLw5SHdqUeRv328AbOCSSZS25Kn7dMTsYYh/RaiLffY9jKoOn4CBFYtYadNOUG1kjvlZqToY1e3Z8ZDbzjyttilrY0eGrefGuqabGF5DG0MGlZJAoSqJIaAYNpwOVDTmSZy7C4edFdD443SzwWffoIYVMjUS+dcvYzVVN2uhHLYrKxA3jc8QM/KvNEvDJgCD2iQ+hh4TawCI2uJAgApLbP8BlV3L+kcnUJaUhwySYxFP5BL1g8QJNJ+uACyaucuujmPlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6754.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(956004)(186003)(478600001)(33716001)(16526019)(33656002)(66946007)(66476007)(66556008)(5660300002)(4326008)(316002)(52116002)(6916009)(86362001)(6496006)(8936002)(83380400001)(9686003)(8676002)(6486002)(1076003)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: LIFPDubblIQtNqeV9Kme1/PClZwBE5VdtCBi6hJlxgkmgwUdKBJ2HoWbmR+j8OFtuH/PrIOl8ctxz7nhKJ0XaoOSnfLd2TIRi6cfGubuk3X647I6lmQqp7XUS1f83mi/dLBxL2QGqxkC3+dfjQnV4Xp8eB2FZfpbkZRDlrNqwQ87Kz6TcVs2s/reqhc2S+zCjDsi/SxGcmbV3iCIdn89K/lEDIEnzwEtCI45/+0WxZhvxt9uCmj3JR06OQ/tv1S4JMTmmEOc0ebkcIL0u2BfXSxTI1KaXT1IXOlWdr8uo+NWKVCqdiR8G0NHSGu9qPyy6ZtaCSzn+J3pGd+Keu8mFruXl1Q/oXuaSJvyLv0M0GDoFdilbBcVDmfNrr8hxeo/BvxaFk6kvwGCm0oZ3vtSrOqX+qo2tWE4ZTRCbUZyIeaVm9TKle2KMIUOFWuYgMNScn/uzchXbRMXtVAUhvFtZkAn+AaXgURklVfTldB01UtdNBSzZ1puVbDhCB0p0BL/
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea85e49-c58c-4e8b-5023-08d81450ee0f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 13:01:49.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1muiOajsWoKxHIeY7UYEdkKxklyR9Rw5huUtdC+QlWNSnyTG/SE/abzWoduEMo9XWEKhwNaU8d6uXZ+XkAlZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5745
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 19, 2020 at 01:09:07PM +0300, Dan Carpenter wrote:
> Hello Ido Schimmel,
> 
> The patch 60833d54d56c: "mlxsw: spectrum: Adjust headroom buffers for
> 8x ports" from Jun 16, 2020, leads to the following static checker
> warning:

Thanks for the report, Dan.

Colin already reported it to me and I have the below patch in my queue
to address the issue. WDYT?

commit 7f3da2eeb1011ce4117ad75df91dc0b16b7b561b
Author: Ido Schimmel <idosch@mellanox.com>
Date:   Thu Jun 18 18:14:04 2020 +0300

    mlxsw: spectrum: Do not rely on machine endianness
    
    The second commit cited below performed a cast of 'u32 buffsize' to
    '(u16 *)' when calling mlxsw_sp_port_headroom_8x_adjust():
    
    mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, (u16 *) &buffsize);
    
    Colin noted that this will behave differently on big endian
    architectures compared to little endian architectures.
    
    Fix this by following Colin's suggestion and have the function accept
    and return 'u32' instead of passing the current size by reference.
    
    Fixes: da382875c616 ("mlxsw: spectrum: Extend to support Spectrum-3 ASIC")
    Fixes: 60833d54d56c ("mlxsw: spectrum: Adjust headroom buffers for 8x ports")
    Signed-off-by: Ido Schimmel <idosch@mellanox.com>
    Reported-by: Colin Ian King <colin.king@canonical.com>
    Suggested-by: Colin Ian King <colin.king@canonical.com>

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index 55af877763ed..029ea344ad65 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -978,10 +978,10 @@ int __mlxsw_sp_port_headroom_set(struct mlxsw_sp_port *mlxsw_sp_port, int mtu,
 
 		lossy = !(pfc || pause_en);
 		thres_cells = mlxsw_sp_pg_buf_threshold_get(mlxsw_sp, mtu);
-		mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, &thres_cells);
+		thres_cells = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, thres_cells);
 		delay_cells = mlxsw_sp_pg_buf_delay_get(mlxsw_sp, mtu, delay,
 							pfc, pause_en);
-		mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, &delay_cells);
+		delay_cells = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, delay_cells);
 		total_cells = thres_cells + delay_cells;
 
 		taken_headroom_cells += total_cells;
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.h b/drivers/net/ethernet/mellanox/mlxsw/spectrum.h
index 6e87457dd635..3abe3e7d89bc 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.h
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.h
@@ -374,17 +374,15 @@ mlxsw_sp_port_vlan_find_by_vid(const struct mlxsw_sp_port *mlxsw_sp_port,
 	return NULL;
 }
 
-static inline void
+static inline u32
 mlxsw_sp_port_headroom_8x_adjust(const struct mlxsw_sp_port *mlxsw_sp_port,
-				 u16 *p_size)
+				 u32 size_cells)
 {
 	/* Ports with eight lanes use two headroom buffers between which the
 	 * configured headroom size is split. Therefore, multiply the calculated
 	 * headroom size by two.
 	 */
-	if (mlxsw_sp_port->mapping.width != 8)
-		return;
-	*p_size *= 2;
+	return mlxsw_sp_port->mapping.width == 8 ? 2 * size_cells : size_cells;
 }
 
 enum mlxsw_sp_flood_type {
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c
index f25a8b084b4b..6f84557a5a6f 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c
@@ -312,7 +312,7 @@ static int mlxsw_sp_port_pb_init(struct mlxsw_sp_port *mlxsw_sp_port)
 
 		if (i == MLXSW_SP_PB_UNUSED)
 			continue;
-		mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, &size);
+		size = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, size);
 		mlxsw_reg_pbmc_lossy_buffer_pack(pbmc_pl, i, size);
 	}
 	mlxsw_reg_pbmc_lossy_buffer_pack(pbmc_pl,
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
index f843545d3478..92351a79addc 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
@@ -782,7 +782,7 @@ mlxsw_sp_span_port_buffer_update(struct mlxsw_sp_port *mlxsw_sp_port, u16 mtu)
 		speed = 0;
 
 	buffsize = mlxsw_sp_span_buffsize_get(mlxsw_sp, speed, mtu);
-	mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, (u16 *) &buffsize);
+	buffsize = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, buffsize);
 	mlxsw_reg_sbib_pack(sbib_pl, mlxsw_sp_port->local_port, buffsize);
 	return mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(sbib), sbib_pl);
 }

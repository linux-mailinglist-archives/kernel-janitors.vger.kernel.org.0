Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3F2182FC0
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 13:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCLMCp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 08:02:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:26531 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgCLMCp (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 08:02:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 05:02:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; 
   d="scan'208";a="442027339"
Received: from unknown (HELO [10.254.208.137]) ([10.254.208.137])
  by fmsmga005.fm.intel.com with ESMTP; 12 Mar 2020 05:02:42 -0700
Cc:     baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/vt-d: Unlock on error paths
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Megha Dey <megha.dey@linux.intel.com>
References: <20200312113730.GF20562@mwanda>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0f0dcaca-5c33-c78c-6d38-2bbae26cbff2@linux.intel.com>
Date:   Thu, 12 Mar 2020 20:02:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312113730.GF20562@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020/3/12 19:37, Dan Carpenter wrote:
> There were a couple places where we need to unlock before returning.
> 
> Fixes: 91391b919e19 ("iommu/vt-d: Populate debugfs if IOMMUs are detected")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/iommu/intel-iommu-debugfs.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu-debugfs.c b/drivers/iommu/intel-iommu-debugfs.c
> index 8d24c4d85cc2..6a495b103972 100644
> --- a/drivers/iommu/intel-iommu-debugfs.c
> +++ b/drivers/iommu/intel-iommu-debugfs.c
> @@ -289,11 +289,12 @@ static int dmar_translation_struct_show(struct seq_file *m, void *unused)
>   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
>   		if (!(sts & DMA_GSTS_TES)) {
>   			seq_puts(m, "DMA Remapping is not enabled\n");
> -			return 0;
> +			goto unlock;
>   		}
>   		root_tbl_walk(m, iommu);
>   		seq_putc(m, '\n');
>   	}
> +unlock:
>   	rcu_read_unlock();
>   
>   	return 0;
> @@ -444,7 +445,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
>   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
>   		if (!(sts & DMA_GSTS_IRES)) {
>   			seq_puts(m, "Interrupt Remapping is not enabled\n");
> -			return 0;
> +			goto unlock;
>   		}
>   
>   		if (iommu->ir_table) {
> @@ -475,6 +476,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
>   		}
>   		seq_putc(m, '\n');
>   	}
> +unlock:
>   	rcu_read_unlock();
>   
>   	return 0;
> 

Thanks a lot for the catch. I think it could be further cleanup. How
about below changes?

index 8d24c4d85cc2..2583a6743dd0 100644
--- a/drivers/iommu/intel-iommu-debugfs.c
+++ b/drivers/iommu/intel-iommu-debugfs.c
@@ -288,8 +288,9 @@ static int dmar_translation_struct_show(struct 
seq_file *m, void *unused)
         for_each_active_iommu(iommu, drhd) {
                 sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
                 if (!(sts & DMA_GSTS_TES)) {
-                       seq_puts(m, "DMA Remapping is not enabled\n");
-                       return 0;
+                       seq_printf(m, "DMA Remapping is not enabled on 
%s\n",
+                                  iommu->name);
+                       continue;
                 }
                 root_tbl_walk(m, iommu);
                 seq_putc(m, '\n');
@@ -431,7 +432,6 @@ static int ir_translation_struct_show(struct 
seq_file *m, void *unused)
         struct dmar_drhd_unit *drhd;
         struct intel_iommu *iommu;
         u64 irta;
-       u32 sts;

         rcu_read_lock();
         for_each_active_iommu(iommu, drhd) {
@@ -441,12 +441,6 @@ static int ir_translation_struct_show(struct 
seq_file *m, void *unused)
                 seq_printf(m, "Remapped Interrupt supported on IOMMU: 
%s\n",
                            iommu->name);

-               sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
-               if (!(sts & DMA_GSTS_IRES)) {
-                       seq_puts(m, "Interrupt Remapping is not enabled\n");
-                       return 0;
-               }
-
                 if (iommu->ir_table) {
                         irta = virt_to_phys(iommu->ir_table->base);
                         seq_printf(m, " IR table address:%llx\n", irta);

Best regards,
baolu

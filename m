Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD31830B2
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 13:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgCLM4A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 08:56:00 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52824 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgCLM4A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 08:56:00 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CCt0ch169005;
        Thu, 12 Mar 2020 12:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=3IjLRGnSKTeS7BpHqOkLjutlfOlpel0LUZcJRVn7ZeE=;
 b=i8e0TI74kE05+c3jiSSg+MONAyxbNXf9Zzk0Dt3z0i9oZQhoz68GlK6iO+EAYj8srjst
 E002iailVehaK/xFUQDh6+ajFcS+FHcDyXNSXZu84jWiBQzUxLDu2NJ6Ms9Y+j46B+jK
 sjBw4OJXMoTfrHjzrJpjTnZAGXHror3hkWZZjIal+bhvZfBjMEK2zL8L2LHOqrV6JUu5
 mzlNvcEZOHUvkU+/Dn/ovWp/d1OH8XNazvjRSPA/Sw5wpXPEzkEOL8boneyvggTj35Ap
 iLR4boF1GxwCIJmemEqZmfOx4+ZXqnC7Sadj6P4AZ2AlzYW5mQvhxgGMekHp1YIdw0R8 pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2ym31usduj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 12:55:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CCrMY3119204;
        Thu, 12 Mar 2020 12:55:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2yp8p79dvr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 12:55:47 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02CCtjWP002515;
        Thu, 12 Mar 2020 12:55:45 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 12 Mar 2020 05:55:44 -0700
Date:   Thu, 12 Mar 2020 15:55:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lu Baolu <baolu.lu@linux.intel.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Megha Dey <megha.dey@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/vt-d: Unlock on error paths
Message-ID: <20200312125539.GG11561@kadam>
References: <20200312113730.GF20562@mwanda>
 <0f0dcaca-5c33-c78c-6d38-2bbae26cbff2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f0dcaca-5c33-c78c-6d38-2bbae26cbff2@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120070
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 12, 2020 at 08:02:41PM +0800, Lu Baolu wrote:
> On 2020/3/12 19:37, Dan Carpenter wrote:
> > There were a couple places where we need to unlock before returning.
> > 
> > Fixes: 91391b919e19 ("iommu/vt-d: Populate debugfs if IOMMUs are detected")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/iommu/intel-iommu-debugfs.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu-debugfs.c b/drivers/iommu/intel-iommu-debugfs.c
> > index 8d24c4d85cc2..6a495b103972 100644
> > --- a/drivers/iommu/intel-iommu-debugfs.c
> > +++ b/drivers/iommu/intel-iommu-debugfs.c
> > @@ -289,11 +289,12 @@ static int dmar_translation_struct_show(struct seq_file *m, void *unused)
> >   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
> >   		if (!(sts & DMA_GSTS_TES)) {
> >   			seq_puts(m, "DMA Remapping is not enabled\n");
> > -			return 0;
> > +			goto unlock;
> >   		}
> >   		root_tbl_walk(m, iommu);
> >   		seq_putc(m, '\n');
> >   	}
> > +unlock:
> >   	rcu_read_unlock();
> >   	return 0;
> > @@ -444,7 +445,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
> >   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
> >   		if (!(sts & DMA_GSTS_IRES)) {
> >   			seq_puts(m, "Interrupt Remapping is not enabled\n");
> > -			return 0;
> > +			goto unlock;
> >   		}
> >   		if (iommu->ir_table) {
> > @@ -475,6 +476,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
> >   		}
> >   		seq_putc(m, '\n');
> >   	}
> > +unlock:
> >   	rcu_read_unlock();
> >   	return 0;
> > 
> 
> Thanks a lot for the catch. I think it could be further cleanup. How
> about below changes?

Obviously that solves the issues with forgetting to drop the lock but
I'm not qualified to comment on the rest.  (And I can't really review
it anyway because the patch was damaged in sending the email).

regards,
dan carepnter


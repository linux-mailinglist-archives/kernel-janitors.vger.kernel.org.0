Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDBB29AA7A
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Oct 2020 12:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1422273AbgJ0LW4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Oct 2020 07:22:56 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37514 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1422270AbgJ0LWz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Oct 2020 07:22:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RBJ1aB013454;
        Tue, 27 Oct 2020 11:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bJr+WZxCdxSOdk5G+i+BcgVxnmws7u8dwouw2EkKcTY=;
 b=GKQWYtvIf9J9aaeX2umNMmzXp+LfDZh0GeVVBQHHywhqxWxQXw6NEzciI0wNCUIKJuOm
 EsJBxUJZhrWl58gQiC49enFgky5aJx/4OdmDPLZBSg4jm+VXE5huKDV7I6/EqhZKG/X9
 x0E8RLGMSmGkpwXLF+YiehekCIHK2WFzntQoQlKBt0FZWW8FKoYg2/wC3/2FzMdj8K8P
 c9WqmcIiwE8LjEIsD5tcKIB80SkdWzmTDGBHIvkCeK3uK2vBNSJrwr1/QFwuBg0n92lS
 tGz6IKQ2Sjbmayggg+rkYlPXjMacTaMGDAgdgS52BGSvyYBzbZSLQjNJE+dEUBX6uU9F fA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 34cc7ksbgp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Oct 2020 11:22:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RBK3ex059539;
        Tue, 27 Oct 2020 11:22:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 34cx5x0egs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Oct 2020 11:22:52 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09RBMp3C018929;
        Tue, 27 Oct 2020 11:22:51 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 27 Oct 2020 04:22:51 -0700
Date:   Tue, 27 Oct 2020 14:22:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hw_random : platform_get_irq() already prints an error
Message-ID: <20201027112246.GS1042@kadam>
References: <20201018054912.GA76941@fedora-thirty-three>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201018054912.GA76941@fedora-thirty-three>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9786 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9786 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270075
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 18, 2020 at 01:49:12AM -0400, Nigel Christian wrote:
> coccicheck
> drivers/char//hw_random/imx-rngc.c:256:2-9: line 256 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 61c844baf26e..69f13ff1bbec 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -253,7 +253,6 @@ static int imx_rngc_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0) {
            ^^^^^^^^
This check is wrong.  It should be:

	if (irq < 0) {

The platform_get_irq() function will never return zero.  But say it
did return a zero then that means that "return irq;" is returning
success which would be a bug.

> -		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
>  		return irq;
>  	}

The patch introduces a new checkpatch warning because now there is only
one statement in the if statment block.  (Patches shouldn't introduce
checkpatch warnings).  It should be:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return irq;

regards,
dan carpenter


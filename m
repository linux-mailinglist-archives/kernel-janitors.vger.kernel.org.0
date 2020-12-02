Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5D2CB4C0
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 06:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgLBF4r (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 00:56:47 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56554 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgLBF4r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 00:56:47 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B25tNjn077401;
        Wed, 2 Dec 2020 05:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lF5ekZH+Fg8QQHRd5BltZ/O/rMlmVp9XZ95mcZEqZCg=;
 b=VO5gxCuwank8i2iHkBPuzfmKrPKaWBYGR5r2qFYqJXkRib+0TRgSa9Twg678uVpg7f1B
 S95Vi5omaBptWJWr62wPFVHfgQFSxyoDrEbZNqV4iqqmWau2dU+zT/v04/PjMfwYT16I
 79gHOVVOKpMUTgkHi7RNCXsnLdrXV27nfWolS2XgiCZiPjgfRoxMAZZPTCcWrwcdcqNp
 CNaItqYeBwk9Mp5lvYWcYI8c51RnM+jT6/oVwh0wDQPF5N1Uc20mcIGCSW1dK/XiQ0xx
 wPhRIMiLvJBHhs5xvwWRJt4Z1G9R7HomCuEhne+VoVu/0/MFv1Ec0+nGtYOXWkEczFtF EQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 353dyqpb9y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 05:56:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B25oJJQ104080;
        Wed, 2 Dec 2020 05:56:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 3540atmagf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 05:56:04 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B25u3f8031077;
        Wed, 2 Dec 2020 05:56:04 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Dec 2020 21:56:03 -0800
Date:   Wed, 2 Dec 2020 08:55:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs/core: Add blank line after variable
 declarations.
Message-ID: <20201202055558.GM2767@kadam>
References: <20201201214714.GA397282@a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201214714.GA397282@a>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020036
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020036
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 01, 2020 at 03:47:14PM -0600, Brother Matthew De Angelis wrote:
> Fix the checkpatch.pl warning:
> 
> rtw_security.c:2374: WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 159d32ace2bc..a3a6558c9e03 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -2371,6 +2371,7 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
>  
>  	if (securitypriv->btkip_countermeasure) {
>  		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
> +
>  		if (passing_ms > 60*1000) {
>  			DBG_871X_LEVEL(_drv_always_, "%s("ADPT_FMT") countermeasure time:%lus > 60s\n",
>  				caller, ADPT_ARG(adapter), passing_ms/1000);
> -- 
> 2.25.1
> 
> Hello kernel janitors,
> 
> this is my third patch and I don't feel very confident yet. Would this patch be worth Greg's time?
> 

I already replied about this patch earlier.  Someone already sent it so
it's not needed.

These patches take about 15 seconds of Greg's time and he deliberately
leaves checkpatch warnings like this for people to practice sending him
patches.

regards,
dan carpenter


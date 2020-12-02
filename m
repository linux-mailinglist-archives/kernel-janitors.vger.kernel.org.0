Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2A92CC556
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 19:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbgLBSkN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 13:40:13 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:47686 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbgLBSkN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 13:40:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2ITCEW139287;
        Wed, 2 Dec 2020 18:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=EtihPShjuCPJjG5edj4pxu0NLVh0gWdqqyzMNCOLYHk=;
 b=lyhZESRfP5E9bQyJuecnCJsPLjdEsSovuo/9IE5AVbxXAoIUhuqKE50bWfCfZloO3JEB
 UjMHI/A16xG/J7Q8jPQwjHVOx3ozorbzLDm+KkFL//P1KKqrvl/mt9VLwfDVXB1ogr99
 wA0SxBzJvYee7tmrcc4tEbMr28O3VI2t+UFbKbNV6jrYMkBoa1aCk9E4U+/SKJnt60nf
 nFANZOBNIBsoMlzsKjfYYdM1loGvtdXRgInoNAapXJbqpYSJxs3sQWF6Zq3NrH+H7mpR
 /zsKOZOfpkx8CkWUcyRdAMAM5VJqeHUkbJvYt6LRSrLDBs0MtJNcj9WOYfPX0I/k4gjj Aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 353egkt0y5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 18:38:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2Ic28Q152300;
        Wed, 2 Dec 2020 18:38:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 3540auqa8y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 18:38:06 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B2IbkS1026781;
        Wed, 2 Dec 2020 18:37:46 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Dec 2020 10:37:46 -0800
Date:   Wed, 2 Dec 2020 21:37:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-ID: <20201202183739.GP2767@kadam>
References: <X8c5gjZO7YN/CFsq@mwanda>
 <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020109
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 02, 2020 at 03:54:53PM +0000, Srinivas Kandagatla wrote:
> Thanks Dan for the patch!
> 
> Do you use any tools to do this checks?
> 

Yeah.  This was a Smatch warning:

sound/soc/codecs/lpass-va-macro.c:847 va_macro_hw_params() warn: always true condition '(decimator >= 0) => (0-u32max >= 0)'

But every static checker will complain about these.

regards,
dan carpenter


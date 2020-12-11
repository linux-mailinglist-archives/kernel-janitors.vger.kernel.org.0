Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C18B2D730B
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 10:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405678AbgLKJsv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 04:48:51 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:19976 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393824AbgLKJs0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 04:48:26 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BB9WZfc011144;
        Fri, 11 Dec 2020 03:46:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=KOa8GeMpJUQpTnzCyJi3VdjT2XgIvw2e6G+BBT2ox/A=;
 b=ZFoxgmDUBBzZuOpYxFK/lZv0a+ZG1WeDeMk8F2r6jRHwQ704wh/jDL4JpJ0X9ndUqj03
 WI2HLp58aLbwIxd/JkK5QU4XMxroHG1kphpX1HZGcX9YmsQVj0roDWW3zuMuODuC/nZU
 8RKiC7wxnXyFS/5wEkXrEzjmLHc/yhUbnVsrTeldgqbeY+2CCbwztnetpkwgXABh9RF/
 iZbLLDjslHSgpkCfHyx7IF2mIPe+/vPa6o+mI4S67+DFfeA0OQ8yYfQEe41GRDKyGLXp
 bDCmNPdKWVhYNB8jGk5Pu+RjnoDM8N49UPlyZ2/Joz4ttLrXQNwvWZisqLiioujVKvUa oQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 3588g7g4yv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 11 Dec 2020 03:46:47 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 11 Dec
 2020 09:46:45 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 11 Dec 2020 09:46:45 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F31B2AB;
        Fri, 11 Dec 2020 09:46:45 +0000 (UTC)
Date:   Fri, 11 Dec 2020 09:46:45 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
        Luo Meng <luomeng12@huawei.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        James Schulman <james.schulman@cirrus.com>,
        Adam Brickman <Adam.Brickman@cirrus.com>,
        "Vlad Karpovich" <Vlad.Karpovich@cirrus.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in
 wm_adsp_create_control()
Message-ID: <20201211094645.GB9673@ediswmail.ad.cirrus.com>
References: <X9B0keV/02wrx9Xs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <X9B0keV/02wrx9Xs@mwanda>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=2
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110059
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 09, 2020 at 09:54:09AM +0300, Dan Carpenter wrote:
> The error handling frees "ctl" but it's still on the "dsp->ctl_list"
> list so that could result in a use after free.  Remove it from the list
> before returning.
> 
> Fixes: 2323736dca72 ("ASoC: wm_adsp: Add basic support for rev 1 firmware file format")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Good spot there, thanks.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

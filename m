Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E29C18824
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2019 12:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfEIKGQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 May 2019 06:06:16 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:48532 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfEIKGP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 May 2019 06:06:15 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x49A3sSl163698;
        Thu, 9 May 2019 10:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=i7gdKY13OqWjq1H60UNtySrCfJqZwFvmD71FXQEwX3Q=;
 b=T3g57MZAzwmjPyLaahrVhONZs/N2JcK5THjE1iQi4tpJv7mmYH8BvkCFJvqQiCwGKske
 9AzvId3dXriNzazfTZfpghZ31jqeDx7hUt2queZZjPrW8Z75iw/9oHIyr52NpNvgP2eL
 X+Y+lJkZ1xuNWyvC1HQlcfZPxCDOcf3ZVMKNCnSele5TEZY1HxgRNXfQVcHbz7FkhAWY
 Mt14OztO9qzugoR/iSxRYTD+Rp5ApgbEVwoWaK1c7gOqqoAOhi3dZs3L/l3iCbYpw+/c
 EPnYOGxundBJNCytT2D/CsYaSchqeh3GqhmCid3dztQyOhJfKVgsFGe3IblLPDMlMMCY iw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2s94b69ses-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 09 May 2019 10:06:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x49A56Vp176253;
        Thu, 9 May 2019 10:06:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2s94bapuvx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 09 May 2019 10:06:07 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x49A66Qp012836;
        Thu, 9 May 2019 10:06:06 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 09 May 2019 10:06:05 +0000
Date:   Thu, 9 May 2019 13:05:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [bug report] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Message-ID: <20190509100559.GB2239@kadam>
References: <20190503131010.GJ29695@mwanda>
 <OSBPR01MB2103C59136CB33ED587BC370B8310@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190509091815.GZ2239@kadam>
 <OSBPR01MB21033A9C4FA8CB03E379E0C5B8330@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21033A9C4FA8CB03E379E0C5B8330@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9251 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090062
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9251 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905090062
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 09, 2019 at 09:59:08AM +0000, Biju Das wrote:
> > I got them for a while, but I fixed it and I thought I had pushed all the fixes...
> 
> I am sure ,I have used the latest snapshot from master branch.

Could you send me your .config?

I can't think how that would matter, but I'm really at a loss...

regards,
dan carpenter


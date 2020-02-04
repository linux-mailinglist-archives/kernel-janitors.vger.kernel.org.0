Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7337915165E
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Feb 2020 08:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgBDHTA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Feb 2020 02:19:00 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:35450 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgBDHTA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Feb 2020 02:19:00 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0147Iwd8006484;
        Tue, 4 Feb 2020 07:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=UH3qwpWF5Nt+0ww45gK/RAfct4N2A1W/O0ELmu1E9zk=;
 b=hM7/5qN56W29WsMnFNj2pJmFAoUoSuuxge0CEX6BNjvM/EKFXCjOTYUGwQmzVGjExvVZ
 jKsCDSD/pk7uhXTR5+A1xLfYgAiynDUkRkI0KURgY+JYwGYMrXTRoPQJ1b7roMxa0RlM
 MRllcXKNnDnra4Gu/HxbdBSIvRHKjrkARrumNuFjPHpISuci2K95HKvgl6AdHCKHHlQw
 Qf1RnTzAHEkfJRv4YJn8P8iy+DPKYQBIS0EaqZdhjDUssV0sDdXM6JXJ8MwF3FShYDuM
 NAlY6emFvDXS90zo12S55gDmNFIdk4jyaolfKdEYl/EOHsqLczNRN4f7DGdtlR2/Nnjn fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2xwyg9gvfh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 07:18:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0147IPxN079513;
        Tue, 4 Feb 2020 07:18:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xxsbmk5pd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 07:18:57 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0147IuWN029640;
        Tue, 4 Feb 2020 07:18:56 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 23:18:55 -0800
Date:   Tue, 4 Feb 2020 10:18:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lauri Jakku <ljakku77@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: HID: Fix timeout by adding retry loop
Message-ID: <20200204071849.GQ1778@kadam>
References: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
 <20200204062749.GP1778@kadam>
 <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040053
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 04, 2020 at 09:00:46AM +0200, Lauri Jakku wrote:
> Hi,
> 
> I'm quite newbie publicly patching stuff, but at anyway:
> 
> On 4.2.2020 8.27, Dan Carpenter wrote:
> > Hi Lauri,
> >
> > There are a bunch of issues with this patch.
> >
> > 1)  There is no way we're going to add a retry loop to
> >     usb_control_msg().  We might add it to a driver, but probably we
> >     would suspect that the hardware is bad.  Maybe the cable is faulty?
> >     Or I could be wrong on that...
> 
> For example there is lot of USB HID related oddities reported
> 
> by multiple users, that have said that after (kernel) update
> 
> of their system USB devices stopped working or work randomly.
> 
> 
> I have problem with my mouse, and the problem went away
> 
> with my patch. I think that the change to driver by driver is
> 
> just code duplication, and with my patch the 'good' HW still
> 
> is not going to sleep even that 20ms, the time that I tought
> 
> to be good. Max retry time is 400ms.
> 

That doesn't sound totally unreasonable.  Go ahead and try sending the
patch.  Maybe they apply it or maybe they don't but either way there
is no harm in sending a patch.

regards,
dan carpenter


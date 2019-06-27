Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1446C58076
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 12:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0Kdr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 06:33:47 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57192 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfF0Kdr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 06:33:47 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RAXdK9141728;
        Thu, 27 Jun 2019 10:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=pHIo8qkYTWw2RlouFBB0K9cnQAPDNdWecb/QPyqxgZs=;
 b=DeGmN4WSSipURHBk/zB8Oi8LO6oeQICicTZnr3i18Z90oo1BBa5UKm7m74DcDbdwbL/l
 sxQZaTWs65mpCEUYB9Gjg9ntQxfQKgM8E38wHpBs3H6LGx8ihl15eerBssmH3xflyZWb
 cIs16c0EtHr5/V/7wzRj0z8AxVJYM61Yde861qYHd1YPo8nCtCxzDaN/YovjSuaa/I0k
 XHI2DIXl9v/WLjhS8KB/n827yDv2bTLsWvRrLFpE8gP4jhi+2Ur2GyBa6neTNOP+e1oa
 s1fObL2FuhsVcM7xGWzr5XxlITkIqM5Rj4PLKkP4IMMl/yube6COIenD81OMDx3P2dEP 2A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2t9c9pyh9b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 10:33:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RAXVu9102642;
        Thu, 27 Jun 2019 10:33:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2tat7da11d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 10:33:38 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5RAXbQY031518;
        Thu, 27 Jun 2019 10:33:37 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 03:33:36 -0700
Date:   Thu, 27 Jun 2019 13:33:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     walter harms <wharms@bfs.de>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
Message-ID: <20190627103330.GA19015@kadam>
References: <20190627071521.GA22903@mwanda>
 <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com>
 <20190627090734.GD5715@kadam>
 <0d9880ff-b4a4-c0a2-f22a-a72bbc0ab754@arm.com>
 <5D1499BE.9090701@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D1499BE.9090701@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270122
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 27, 2019 at 12:26:06PM +0200, walter harms wrote:
> 
> 
> Am 27.06.2019 11:09, schrieb Vincenzo Frascino:
> > Hi Dan,
> > 
> > On 6/27/19 10:07 AM, Dan Carpenter wrote:
> >> On Thu, Jun 27, 2019 at 09:58:18AM +0100, Vincenzo Frascino wrote:
> >>>>    119	fallback:
> >>>>    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
> >>>>                                                                                  ^^^
> >>>> On x86 this "res" always gets dereferenced.
> >>>>
> >>>>    121	}
> >>>>
> >>>
> >>> I am not sure I understand the details of this bug report. As far as I can see
> >>> "res" is never dereferenced in the vDSO library in this case, but it is passed
> >>> to the system call unchanged.
> >>>
> >>
> >> Oh yeah.  Sorry.  My bad.  False positive.  clock_gettime_fallback()
> >> doesn't necessarily dereference "res".
> >>
> > 
> > No problem, better a false positive than an ignored negative :-)
> > 
> 
> maybe it would be clever to add a comment here indicating that this
> is intended and no problem ?
> 

No.  The correct response is to fix Smatch.  I will do it.

regards,
dan carpenter


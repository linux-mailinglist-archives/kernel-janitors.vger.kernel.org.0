Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC18F57EF1
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 11:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfF0JHr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 05:07:47 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59100 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0JHr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 05:07:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R93ra1149602;
        Thu, 27 Jun 2019 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=UhHus/Uzy2D755z9H464rH2i3T3MnOF9ibT+vry8ytE=;
 b=DTCH8ytSYsipLvu1B6z3u/dQ3dhGv//LTBANS72cDI+H7yMXavc6BG4cB7wGVhS+jZmr
 QUsWLsHYuSKWQCpsMy8RaS/8eIRAcEoWb018dltR0mhHcb4hyr2CNdlNAYzkk3HpC6uM
 VSwdmBdJtd5iP+JAUT3d/to4wSk8d+C01JxI5PIGfilcXuoRS5kZpy4cCIgp8K/YiPqL
 44cJPELVlqvSOvNHP+NFUcCjuJO7AhsLURMPyIkmTs87q/W1VncISINiGnRxIE02u3dT
 I6OwODGMKuRi1wIAUa495wXc2oMqB3EjO1qOz/SHjdWYY1kBmWKsrWSXiQrKC2jbtvoo 8w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2t9brtf5wx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 09:07:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R97YtA187558;
        Thu, 27 Jun 2019 09:07:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2t9acd4uwj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 09:07:42 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5R97fKc005076;
        Thu, 27 Jun 2019 09:07:41 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 02:07:41 -0700
Date:   Thu, 27 Jun 2019 12:07:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
Message-ID: <20190627090734.GD5715@kadam>
References: <20190627071521.GA22903@mwanda>
 <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270107
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 27, 2019 at 09:58:18AM +0100, Vincenzo Frascino wrote:
> >    119	fallback:
> >    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
> >                                                                                  ^^^
> > On x86 this "res" always gets dereferenced.
> > 
> >    121	}
> > 
> 
> I am not sure I understand the details of this bug report. As far as I can see
> "res" is never dereferenced in the vDSO library in this case, but it is passed
> to the system call unchanged.
>

Oh yeah.  Sorry.  My bad.  False positive.  clock_gettime_fallback()
doesn't necessarily dereference "res".

regards,
dan carpenter


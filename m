Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8891C5068
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 May 2020 10:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgEEIfU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 May 2020 04:35:20 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59960 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgEEIfU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 May 2020 04:35:20 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0458RgjW032682;
        Tue, 5 May 2020 08:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=Z1bOqVi1e3bGT5MI7b+CLKkezFIAqTzQ89Ba9uQIs88=;
 b=jPoSMvv2GyhhcHVq1I1X/76PQRfSEcooyVLviMjiomU56oVv+IhMc2skUEa7l/qepfAk
 tnAppmDTU+V2Fy3+aQ4NpnGZ9AnHSV6451GuXUJ3h+D5Ylq5TDs8lF1pZZa3gMrUtP1O
 t3Nsx9YqA4EZU5td1FB8KulLUZL/X71V6mlAaRzTP3lYynzmMDri+3+n9EeTbqmOw1Qc
 LzehAHV42U7MF75ROhlIv9n7VoQXexOBHDoP38LKapLKv4fplruC2E7nDue3oMMkQBBx
 z4jtJQo6pRyDt9ixyowcvWCEegyrMzMgCIZJh72H13BY8AmUyEsRXsYfTwMKQK0fXoFG fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 30s09r3bh5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 May 2020 08:35:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0458QkUA185481;
        Tue, 5 May 2020 08:35:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 30sjdsgxs3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 May 2020 08:35:15 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0458ZEZJ004688;
        Tue, 5 May 2020 08:35:15 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 May 2020 01:35:14 -0700
Date:   Tue, 5 May 2020 11:35:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: question about lists
Message-ID: <20200505083505.GY2014@kadam>
References: <alpine.DEB.2.21.2005032308500.2533@hadrien>
 <07ecfa7c-897b-5bea-e84b-f0626f019842@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07ecfa7c-897b-5bea-e84b-f0626f019842@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005050068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050068
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 04, 2020 at 09:41:21PM +0200, Christophe JAILLET wrote:
>    - in your example, before commit f52c380a48f52, it was allocated with
> kmalloc, so it was maybe to avoid a really unlikely '__list_add_valid'
> failure. Now that it is kzalloc'ed, this can not happen anymore.

No, it was never possible to get a __list_add_valid() failure.  The list
you're adding to has to be initialized, but the list item that doesn't.
In __list_add_valid() the "new" is "&entry_obj->list" which is an offset
into the entry_obj object.

regards,
dan carpenter


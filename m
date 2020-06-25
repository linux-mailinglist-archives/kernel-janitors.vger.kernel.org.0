Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFB220A314
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Jun 2020 18:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404273AbgFYQgU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 25 Jun 2020 12:36:20 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:55432 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404064AbgFYQgU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Jun 2020 12:36:20 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGX7Up039353;
        Thu, 25 Jun 2020 16:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=2Y5VD8dEMVcdJf5rw6BL7RPq3opTIQnYbFtcM1IQMZs=;
 b=M+r+2RkSVHf3RtRTgwsHHy5GEutJIFX6HF5S//Ovk2hs0hStLXMDw//5f2ocryIiYmow
 sPHaYscRONcRDoatCpv/fV3hDulXEYck/pR7M3vHqdxhcCRNiN7VR5H75w5zqjEniotp
 U8iNW3pScd/+A9ECX6uziH/8dtplZrtRfWgPc8uvBnmlXsncL1o6KcKjV/JX+eq3ZEPv
 GqVDjMjjWe9QLS9CJ+L38XSkuRVMBbY5D3ujp1xPDPdiEUJTXTHkpNrqV+NzGND2KGQr
 ciOekuHFUL8tIMqKRNGRFqgvi0SSVEpc/SZTMhxAiEF17I271o+jTif99p2b5Pjd4GKL PA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 31uut5sjve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jun 2020 16:36:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGY0Cp123815;
        Thu, 25 Jun 2020 16:36:17 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 31uur1g96t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Jun 2020 16:36:17 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05PGaGG1014173;
        Thu, 25 Jun 2020 16:36:16 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 25 Jun 2020 16:36:16 +0000
Date:   Thu, 25 Jun 2020 19:36:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] tty: cyclades, cache HW version
Message-ID: <20200625163611.GE2549@kadam>
References: <20200624131858.GA9972@mwanda>
 <f83c673e-0046-47b6-97b8-0aab80c85a9c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f83c673e-0046-47b6-97b8-0aab80c85a9c@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006250103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 cotscore=-2147483648 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006250103
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 25, 2020 at 10:57:46AM +0200, Jiri Slaby wrote:
> Hi,
> 
> On 24. 06. 20, 15:18, Dan Carpenter wrote:
> > [ Kees recently removed the uninitialized_var() variable so ancient
> >   code has started to print warnings.  GCC doesn't warn about
> >   uninitialized variables these days either.  It's been buggy for
> >   10 years so it's probably not an emergency.  -dan ]
> > 
> > Hello Jiri Slaby,
> > 
> > The patch 101b81590d8d: "tty: cyclades, cache HW version" from Jun
> > 11, 2009, leads to the following static checker warning:
> > 
> > 	drivers/tty/cyclades.c:3805 cy_pci_probe()
> > 	error: uninitialized symbol 'mailbox'.
> > 
> > drivers/tty/cyclades.c
> >   3640  static int cy_pci_probe(struct pci_dev *pdev,
> >   3641                  const struct pci_device_id *ent)
> >   3642  {
> >   3643          struct cyclades_card *card;
> >   3644          void __iomem *addr0 = NULL, *addr2 = NULL;
> >   3645          char *card_name = NULL;
> >   3646          u32 mailbox;
> >                 ^^^^^^^^^^^^
> > 
> >   3647          unsigned int device_id, nchan = 0, card_no, i, j;
> >   3648          unsigned char plx_ver;
> >   3649          int retval, irq;
> >   3650  
> >   3651          retval = pci_enable_device(pdev);
> >   3652          if (retval) {
> >   3653                  dev_err(&pdev->dev, "cannot enable device\n");
> >   3654                  goto err;
> >   3655          }
> >   3656  
> >   3657          /* read PCI configuration area */
> >   3658          irq = pdev->irq;
> >   3659          device_id = pdev->device & ~PCI_DEVICE_ID_MASK;
> 
> It looks like you and/or your analyzer missed this line ^^?

Both of us missed it.  It turns out there is a bug in Smatch and also
some missing features which triggered this warning.

Thanks for taking a look at it.

regards,
dan carpenter


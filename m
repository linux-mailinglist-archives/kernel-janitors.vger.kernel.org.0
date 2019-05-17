Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAD02205A
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 May 2019 00:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfEQWeU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 May 2019 18:34:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:48203 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbfEQWeU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 May 2019 18:34:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 May 2019 15:34:20 -0700
X-ExtLoop1: 1
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2019 15:34:19 -0700
Received: from orsmsx104.amr.corp.intel.com ([169.254.4.200]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.55]) with mapi id 14.03.0415.000;
 Fri, 17 May 2019 15:34:19 -0700
From:   "Bowers, AndrewX" <andrewx.bowers@intel.com>
To:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
Subject: RE: [Intel-wired-lan] [PATCH] i40e/i40evf: cleanup
 i40e_update_nvm_checksum()
Thread-Topic: [Intel-wired-lan] [PATCH] i40e/i40evf: cleanup
 i40e_update_nvm_checksum()
Thread-Index: AQHVBk+PEe+aAebrB0izRitjLZDSJqZv9IzQ
Date:   Fri, 17 May 2019 22:34:19 +0000
Message-ID: <26D9FDECA4FBDD4AADA65D8E2FC68A4A1D3DB7A7@ORSMSX104.amr.corp.intel.com>
References: <20190509101051.GB7024@mwanda>
In-Reply-To: <20190509101051.GB7024@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjU2Y2MwZmEtZDNlNC00N2E0LTg5YWItYWVmODkwOWIzNmQyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRHN0OXpcL09LZkNLXC9uQjdackRPQlRNT3BLQUxNVEtaYndBM1ZDZ3BxMFhXSStGWnZOd2hmUzF3cmtMYmhZbndiIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of Dan Carpenter
> Sent: Thursday, May 9, 2019 3:11 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>
> Cc: kernel-janitors@vger.kernel.org; intel-wired-lan@lists.osuosl.org
> Subject: [Intel-wired-lan] [PATCH] i40e/i40evf: cleanup
> i40e_update_nvm_checksum()
> 
> Smatch complains that we use 'checksum' when it's uninitialized.
> 
>     drivers/net/ethernet/intel/i40e/i40e_nvm.c:581
> i40e_update_nvm_checksum()
>     error: uninitialized symbol 'checksum'.
> 
> This is true, but it harmless because we don't use it again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/intel/i40e/i40e_nvm.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

kernel-janitors@vger.kernel.org; intel-wired-lan@lists.osuosl.org



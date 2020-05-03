Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377561C2F5A
	for <lists+kernel-janitors@lfdr.de>; Sun,  3 May 2020 23:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgECVKD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 3 May 2020 17:10:03 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:11736
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729068AbgECVKC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 3 May 2020 17:10:02 -0400
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; 
   d="scan'208";a="347597687"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 May 2020 23:10:01 +0200
Date:   Sun, 3 May 2020 23:10:01 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     kernel-janitors@vger.kernel.org
Subject: question about lists
Message-ID: <alpine.DEB.2.21.2005032308500.2533@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

I was wondering what is the point of code like the following:

        INIT_LIST_HEAD(&bb->list);
        list_add(&bb->list, &s->workload->shadow_bb);

As far as I can see, list_add will initialize both fields of the list_head
structure without looking at their values, so why is the INIT_LIST_HEAD
needed?

thanks,
julia

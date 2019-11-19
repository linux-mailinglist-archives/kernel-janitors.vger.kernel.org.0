Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A881102B59
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Nov 2019 19:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKSSED (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Nov 2019 13:04:03 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:4355 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbfKSSED (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Nov 2019 13:04:03 -0500
X-IronPort-AV: E=Sophos;i="5.69,218,1571695200"; 
   d="scan'208";a="412559093"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256; 19 Nov 2019 19:04:02 +0100
From:   Julia Lawall <Julia.Lawall@lip6.fr>
To:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Gilles Muller <Gilles.Muller@inria.fr>
Subject: [PATCH 0/4] improve platform_get_irq.cocci
Date:   Tue, 19 Nov 2019 18:28:16 +0100
Message-Id: <1574184500-29870-1-git-send-email-Julia.Lawall@lip6.fr>
X-Mailer: git-send-email 1.9.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Various cleanups in platform_get_irq.cocci to give more useful
patches and to give a few more results.

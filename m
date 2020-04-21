Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4940C1B212A
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Apr 2020 10:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDUIND (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Apr 2020 04:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDUIND (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Apr 2020 04:13:03 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB480C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2020 01:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=LdnxjLv/EyzKUWXKesZ4hj5KMspph7tIzRGV+P8o+kA=; b=Wuv98VsXv4jcnChhxUQwPnvUCr
        w5Ac3AbLzQEBnsa3BfVE8oX2PA2yYKsvJ2qiPvBleBcDmNkQLIc3QkHrQs4veqGEtFCszhTddSf7O
        86c/VGGskppwHEOVQIvKRw/30FNVY9TsKO+FGuqF4abE3o9ARRoV8kaUCVGGQ2TKk307glx52u6rh
        qowTXbV6Mqn6YJLcurUKO82EkwMcQxQHpElR8fvggaofM5xvLRvFxi2LCyMz8ST+NFHXOUZX7Bfrz
        yzvZ9xAhWyvBiEt1Rko3EGodbwy+xbCaGEyJZoqW0rMYl5dhkih9FyNo/++XknXulQVMpiPrArOyk
        5q5v19Ag==;
Received: from [2001:4bb8:191:e12c:292e:7dec:cf13:becd] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQo1e-0003jZ-D1
        for kernel-janitors@vger.kernel.org; Tue, 21 Apr 2020 08:13:02 +0000
Date:   Tue, 21 Apr 2020 10:12:57 +0200
From:   Christoph Hellwig <hch@infradead.org>
To:     kernel-janitors@vger.kernel.org
Subject: new TODO list item
Message-ID: <20200421081257.GA131897@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Janitors,

if someone feels like helping with a fairly trivial legacy API, the
wrappers in include/linux/pci-dma-compat.h should go away.  This is
mostly trivially scriptable, except for dma_alloc_coherent, where
the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
with GFP_KERNEL when not calling from an atomic context.

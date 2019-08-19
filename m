Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145E0951F6
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Aug 2019 01:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbfHSXy5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Aug 2019 19:54:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54046 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728554AbfHSXy5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Aug 2019 19:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TbjkwkGLozMz+tjIqOBE4qbg59ZjOKNgp/t7IRDV4SM=; b=czLuMTr1x075BEUmHMGSTJUpRq
        Y4VbjCScXoRffV01vRJEOff4m2zVZXvlgK31+VfSI46nA9rTvNzuZAz0YEsNtsU/Co2T+XpOhDdTF
        CkC9iKgdBbQKnYNEtivnsnfwgGij4DKbW1jvgzMfxVo4Ppgg2tKAwYd9y9oLHDa6IJLF0P8XjBDb5
        ZoqaPSfoWj6EMVvT1pwHvzeXuqh7V2TqCdzdhBDANi3vTkGntKsL+brQLACUnRHsRiYgkhhHHa+bU
        qtsuI+vZ6FnWQ81urw2i8IMBfBjCrzCT3HfPzD23Ri9rp0jlB5+ihgF2MlaGvn01n1ZRwcQiSMvSo
        x8y/pk3A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hzrUG-00060Q-BA; Mon, 19 Aug 2019 23:54:56 +0000
Date:   Mon, 19 Aug 2019 16:54:56 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-kernel-mentees@lists.linuxfoundation.org, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PROJECT] clean up swapcache use of struct page
Message-ID: <20190819235456.GA9657@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


This would be a good project for someone with a little experience and
a lot of attention to detail.

The struct page is probably the most abused data structure in the kernel,
and for good reason.  But some of the abuse is unnecessary ... a mere
historical accident that would be better fixed.

Page cache pages use page->mapping and page->index to indicate which file
the page belongs to and where in that file it is.  page->private may be
used by the filesystem for its own purposes (eg buffer heads).

Anonymous pages use page->mapping to point to the anon VMA they belong
to and page->index to record the offset within the VMA.  Then, if they
are also part of the swap cache, they use page->private to record both
the offset within the swap device and the index of the page within the
swap device.

Then we get abominations like:

static inline pgoff_t page_index(struct page *page)
{
        if (unlikely(PageSwapCache(page)))
                return __page_file_index(page);
        return page->index;
}

My modest proposal for deleting the first two lines of that function is
to first switch the uses of page->private and page->index for anonymous
pages.  Then move the swp_type() back from page->index to page->private
again [1].

I am willing to review patches and provide feedback.  I can go into more
detail about how I think this should be tackled if there's interest.
Also, if you know more than I do about the MM and think this is a bad
idea, please do say ;-)

This is going to be a tough project because there are a lot of
rarely-tested paths which directly reference (eg) page->index, and they
might be talking about a page cache page or a swap page.  This is not
a simple Coccinelle script.

[1] We have enough bits to do this; on a 32-bit machine, we can at most
have a VMA which covers 4GB memory and with a 4kB page size, that's only
20 bits needed to encode all possible offsets within a VMA).

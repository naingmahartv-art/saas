import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable';

// Shared report-PDF builder: a title, an optional session-context subtitle,
// and one or more table sections (each with its own optional heading, e.g.
// per-voucher blocks in the Agent report). Returns a Blob ready for
// download or navigator.share({ files: [...] }).
export function buildReportPdf({ title, subtitle, sections }) {
  const doc = new jsPDF();
  let y = 16;

  doc.setFontSize(14);
  doc.text(title, 14, y);
  y += 6;

  if (subtitle) {
    doc.setFontSize(10);
    doc.setTextColor(120);
    doc.text(subtitle, 14, y);
    doc.setTextColor(0);
    y += 6;
  }

  for (const section of sections) {
    if (section.heading) {
      doc.setFontSize(11);
      doc.setTextColor(0);
      doc.text(section.heading, 14, y + 4);
      y += 8;
    }
    autoTable(doc, {
      startY: y,
      head: section.head,
      body: section.rows,
      styles: { fontSize: 9 },
      headStyles: { fillColor: [79, 70, 229] },
      margin: { left: 14, right: 14 },
    });
    y = doc.lastAutoTable.finalY + 8;

    if (y > 270) {
      doc.addPage();
      y = 16;
    }
  }

  return doc.output('blob');
}

export function reportFileName(prefix, dateLabel, ext) {
  return `${prefix}-${dateLabel}.${ext}`;
}
